unit GlobalDataUnit;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, InterfaceUnit,
  ZSqlUpdate, DataUnit, SimpleDialog, DateUtils, UtilsUnit, ComCtrls;

type
  
  TdmGlobalData = class(TDataModule)
    zqrAny: TZQuery;
    zuqEmpty: TZUpdateSQL;
    zqrCashKeyItem: TZQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    FMaster : IMaster;
  protected
    procedure OnGetValue(const VarName: String; var Value: Variant);
    function  OnUserFunction(const MethodName: String; var Params: Variant): Variant;
  public
    { Public declarations }

    function  ClearCash(const ARef : integer) : Boolean;
    property  Master : IMaster read FMaster;
  public
    function  DatasetPost(DataSet : TDataSet; ACancel : Boolean = False) : Boolean;
    function  DatasetCancel(DataSet : TDataSet) : Boolean;
    function  DataSetEdit(DataSet : TDataSet) : Boolean;
    function  DatasetInEdit(Dataset : TDataset) : Boolean;
    function  DatasetAppend(Dataset : TDataset) : Boolean;

    function  LoadFromCashKeyItem(const KeyWord, SQL : string; Sender : TObject; const ID_NAME : Boolean = False) : Boolean; overload;
    function  LoadFromCashKeyItem(const KeyWord, SQL : string; Key,Item : TStrings; const ID_NAME : Boolean = False) : Boolean; overload;

    procedure FillKeyItemList(DataSet : TDataSet; ItemValue, KeyValue : TStrings; ID_NAME : Boolean = False);
    procedure FillItemList(DataSet : TDataSet; ItemValue : TStrings; AFieldName : string);

    procedure SetDateParam(Param : TParam; Value : Variant);

    procedure DefaultItemList(Sender : TObject; const ASQL : string; AFieldName : string = '');
    procedure FillTree(zqrHistory : TDataSet; tvTree: TTreeView);
    function UserInfo : TUserInfo;
 end;

var
  dmGlobalData: TdmGlobalData;

implementation

{$R *.dfm}

uses Forms, Math, ConstUnit, Variants, StrUtils, DBGridEh, DBCtrlsEh{,
     FileCtrl};

procedure TdmGlobalData.FillTree(zqrHistory : TDataSet; tvTree: TTreeView);
var
   a_id: integer;
  headNode: TTreeNode;
  askNode: TTreeNode;
  priNode: TTreeNode;
  nodeText: string;
begin
     a_id := 0;
     zqrHistory.First;
     while not zqrHistory.Eof do
     begin
       if a_id <> zqrHistory.FieldByName('ask_id').AsInteger then
       begin
         a_id := zqrHistory.FieldByName('ask_id').AsInteger;
         headNode := TTreeNode.Create(tvTree.Items);
         nodeText := 'Випадок №' + IntToStr(a_id) + ' Дата: ' + DateToStr(zqrHistory.FieldByName('ask_date').AsDateTime);
         askNode := tvTree.Items.Add(headNode, nodeText);
       end;

       nodeText := 'Прийом №' + IntToStr(zqrHistory.FieldByName('pri_id').AsInteger) + ' Дата: ' + DateToStr(zqrHistory.FieldByName('pri_date').AsDateTime);
       priNode := tvTree.Items.AddChild(askNode, nodeText);

       nodeText := 'Лікар: ' + zqrHistory.FieldByName('doc_fio').AsString;
       tvTree.Items.AddChild(priNode, nodeText);
       nodeText := 'Скарги: ' + zqrHistory.FieldByName('pri_trouble').AsString;
       tvTree.Items.AddChild(priNode, nodeText);
       //nodeText := 'Лікування: ' + zqrHistory.FieldByName('pri_heal').AsString;
       //tvTree.Items.AddChild(priNode, nodeText);
       //nodeText := 'Результат: ' + zqrHistory.FieldByName('pri_result').AsString;
       //tvTree.Items.AddChild(priNode, nodeText);

       zqrHistory.Next;
     end;

end;


function TdmGlobalData.ClearCash(const ARef : integer): Boolean;
var i : Integer;
begin

  if ARef = RFR_ALL then
  begin
    for i := 0 to Self.ComponentCount - 1 do
    begin
      if Self.Components[i] is TZQuery then
      begin
        TZQuery(Self.Components[i]).Close;
      end;
    end;
    //FMaster.RefreshReference(RFR_ALL);
  end;
  {else if ARef = RFR_CORRS then
  begin
    zqrCashKeyItem.Filter   := Format('%s=''%s''',[API_KEYWORD, AnsiUpperCase(KW_CORRS)]);
    zqrCashKeyItem.Filtered := True;
    while not zqrCashKeyItem.Eof do zqrCashKeyItem.Delete;
  end
  else if ARef = RFR_OPER then
  begin
    zqrCashKeyItem.Filter   := Format('%s=''%s''',[API_KEYWORD, AnsiUpperCase(KW_OPER)]);
    zqrCashKeyItem.Filtered := True;
    while not zqrCashKeyItem.Eof do zqrCashKeyItem.Delete;
  end
  else if ARef = RFR_CONTRACT then
  begin
    zqrCashKeyItem.Filter   := Format('%s=''%s''',[API_KEYWORD, AnsiUpperCase(KW_CONTRACT)]);
    zqrCashKeyItem.Filtered := True;
    while not zqrCashKeyItem.Eof do zqrCashKeyItem.Delete;
  end
   else if ARef = RFR_ZAKAZ then
  begin
    zqrCashKeyItem.Filter   := Format('%s=''%s''',[API_KEYWORD, AnsiUpperCase(KW_ZAKAZ)]);
    zqrCashKeyItem.Filtered := True;
    while not zqrCashKeyItem.Eof do zqrCashKeyItem.Delete;
  end
  else if ARef = RFR_SS then
  begin
    zqrCashKeyItem.Filter   := Format('%s=''%s''',[API_KEYWORD, AnsiUpperCase(KW_SS)]);
    zqrCashKeyItem.Filtered := True;
    while not zqrCashKeyItem.Eof do zqrCashKeyItem.Delete;
  end;         }

  Result := True;
end;

procedure TdmGlobalData.DataModuleCreate(Sender: TObject);
begin
  FMaster := Application.MainForm as IMaster;

  if not Assigned(FMaster) then
    raise Exception.Create('Can find IMaster form');

  FMaster.Report.SetGlobalGetValue(OnGetValue);
  FMaster.Report.SetGlobalUserFunc(OnUserFunction);
  FMaster.Report.RegFunction('function GetDeptExt(const dept_id : integer) : string');
end;

function TdmGlobalData.DatasetAppend(Dataset: TDataset): Boolean;
begin
  Result := dmSimpleClient.DatasetAppend(DataSet);
end;

function TdmGlobalData.DatasetCancel(DataSet: TDataSet): Boolean;
begin
  Result := dmSimpleClient.DatasetCancel(DataSet);
end;

function TdmGlobalData.DataSetEdit(DataSet: TDataSet): Boolean;
begin
  Result := dmSimpleClient.DataSetEdit(DataSet);
end;

function TdmGlobalData.DatasetInEdit(Dataset: TDataset): Boolean;
begin
  Result := dmSimpleClient.DatasetInEdit(DataSet);
end;

function TdmGlobalData.DatasetPost(DataSet: TDataSet;
  ACancel: Boolean): Boolean;
begin
  Result := dmSimpleClient.DatasetPost(DataSet, ACancel);
end;

procedure TdmGlobalData.DefaultItemList(Sender: TObject; const ASQL: string;
  AFieldName: string);
var IL : TStrings;
begin
  if Sender is TCustomDBComboBoxEh then
    IL := TCustomDBComboBoxEh(Sender).Items
  else if Sender is TColumnEh then
    IL := TColumnEh(Sender).PickList
  else Exit;

  if Assigned(IL) then
  with zqrAny do
  try
    SQL.Text := ASQL;
    if FMaster.GetData(zqrAny) then
    begin
      if AFieldName = '' then
      begin
        if Fields.Count = 1 then
          AFieldName := Fields[0].FieldName
        else if Fields.Count = 2 then
          AFieldName := Fields[1].FieldName
        else if FindField(API_NAME_U) <> nil then
          AFieldName := API_NAME_U
        else
          AFieldName := API_NAME;
      end;
      FillItemList(zqrAny, IL, AFieldName);
    end;
  finally
    Close;
  end;
end;

procedure TdmGlobalData.FillItemList(DataSet: TDataSet;
  ItemValue: TStrings; AFieldName: string);
var FItem: TField;
begin
  try
    ItemValue.BeginUpdate;
    ItemValue.Clear;
    if DataSet.IsEmpty then Exit;
    with DataSet do
    try
      DisableControls;
      FItem := FindField(AFieldName);
      if Assigned(FItem) then
      begin
        First;
        while not Eof do
        begin
          ItemValue.Add(FItem.AsString);
          Next;
        end;
      end;
    finally
      EnableControls;
    end;
  finally
    ItemValue.EndUpdate;
  end;
end;

procedure TdmGlobalData.FillKeyItemList(DataSet: TDataSet; ItemValue,
  KeyValue: TStrings; ID_NAME: Boolean);
var FItem, FKey : TField;
begin
  try
    ItemValue.BeginUpdate;
    ItemValue.Clear;
    if Assigned(KeyValue) then
    begin
      KeyValue.BeginUpdate;
      KeyValue.Clear;
    end;
    if DataSet.IsEmpty then Exit;
    with DataSet do
    try
      DisableControls;
      FKey  := FindField(API_ID);
      if not Assigned(FKey) then
        FKey := Fields[0];
      FItem := FindField(API_NAME);
      if not Assigned(FItem) then
      begin
        FItem := FindField(API_NAME_R);
        if not Assigned(FItem) then
        begin
          FItem := FindField(API_NAME_U);
          if not Assigned(FItem) then
            FItem := Fields[1];
        end;
      end;
      First;
      while not Eof do
      begin
        if KeyValue <> ItemValue then
          if Assigned(KeyValue) then
            KeyValue.Add(FKey.AsString);
        if not ID_NAME then
          ItemValue.Add(FItem.AsString)
        else
          ItemValue.Add(FKey.AsString + ' ' + FItem.AsString);
        Next;
      end;
    finally
      EnableControls;
    end;
  finally
    ItemValue.EndUpdate;
    if Assigned(KeyValue) then
      KeyValue.EndUpdate;
  end;
end;

function TdmGlobalData.LoadFromCashKeyItem(const KeyWord, SQL: string;
  Sender: TObject; const ID_NAME: Boolean): Boolean;
begin
  if Sender is TColumnEh then
    Result := LoadFromCashKeyItem(KeyWord, SQL, TColumnEh(Sender).KeyList, TColumnEh(Sender).PickList, ID_NAME)
  else if Sender is TCustomDBComboBoxEh then
    Result := LoadFromCashKeyItem(KeyWord, SQL, TCustomDBComboBoxEh(Sender).KeyItems, TCustomDBComboBoxEh(Sender).Items, ID_NAME)
  else
    Result := False;
end;

function TdmGlobalData.LoadFromCashKeyItem(const KeyWord, SQL: string; Key,
  Item: TStrings; const ID_NAME: Boolean): Boolean;
begin
  Result := zqrCashKeyItem.Active;
  if not Result then
  begin
    zqrCashKeyItem.UpdateObject := zuqEmpty;
    zqrCashKeyItem.SQL.Text := 'select null::varchar keyword, null::integer id, null::varchar "name"' + #13#10 +
                               'where 1=2';
    Result := FMaster.GetData(zqrCashKeyItem);
    if not Result then Exit;
    zqrCashKeyItem.EmptyDataSet;
  end;

  zqrCashKeyItem.Filter   := Format('%s=''%s''',[API_KEYWORD, AnsiUpperCase(KeyWord)]);
  zqrCashKeyItem.Filtered := True;

  if zqrCashKeyItem.IsEmpty then
  begin
    zqrAny.Close;
    zqrAny.SQL.Text := SQL;
    if FMaster.GetData(zqrAny) then
    begin
      zqrAny.First;
      while not zqrAny.Eof do
      begin
        zqrCashKeyItem.AppendRecord([AnsiUpperCase(KeyWord),zqrAny.Fields[0].AsInteger, zqrAny.Fields[1].AsString]);
        zqrAny.Next;
      end;
    end;
  end;
  Result := not zqrCashKeyItem.IsEmpty;
  if Result then
    FillKeyItemList(zqrCashKeyItem,Item, Key, ID_NAME);
end;

procedure TdmGlobalData.OnGetValue(const VarName: String;
  var Value: Variant);
begin

end;

function TdmGlobalData.OnUserFunction(const MethodName: String;
  var Params: Variant): Variant;
begin

end;

procedure TdmGlobalData.SetDateParam(Param: TParam; Value: Variant);
var dt : TDateTime;
begin
  dt := V2Dt(Value);
  Param.DataType := ftDate;
  if dt = 0 then
    Param.Value := Null
  else
    Param.AsDate := dt;
end;

function TdmGlobalData.UserInfo: TUserInfo;
begin
  Result := dmSimpleClient.UserInfo;
end;

end.
