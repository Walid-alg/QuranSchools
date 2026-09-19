unit Unit4;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Phys.SQLiteDef, FireDAC.FMXUI.Wait,
  FireDAC.Comp.Client, FireDAC.Comp.UI, FireDAC.Phys.SQLite, Data.DB,
  FireDAC.Comp.DataSet;

type
  TDataModule4 = class(TDataModule)
    FDConnection1: TFDConnection;
    FDTable1: TFDTable;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDQuery1: TFDQuery;
    FDTable2: TFDTable;
    FDTable3: TFDTable;
    FDTable1id: TFDAutoIncField;
    FDTable1first_name: TWideMemoField;
    FDTable1last_name: TWideMemoField;
    FDTable1birth_date: TDateField;
    FDTable1age: TIntegerField;
    FDTable1address: TWideMemoField;
    FDTable1gender: TWideMemoField;
    FDTable1phone: TWideMemoField;
    FDTable1enrollment_date: TDateField;
    FDTable1level: TWideMemoField;
    FDTable1guardian_id: TIntegerField;
    FDTable1teacher_id: TIntegerField;
    FDTable4: TFDTable;
    FDTable1email: TWideMemoField;
    FDTable2id: TFDAutoIncField;
    FDTable2first_name: TWideMemoField;
    FDTable2last_name: TWideMemoField;
    FDTable2address: TWideMemoField;
    FDTable2phone: TWideMemoField;
    FDTable2email: TWideMemoField;
    FDTable2specialization_id: TIntegerField;
    FDTable3id: TFDAutoIncField;
    FDTable3first_name: TWideMemoField;
    FDTable3last_name: TWideMemoField;
    FDTable3relationship: TWideMemoField;
    FDTable3address: TWideMemoField;
    FDTable3phone: TWideMemoField;
    FDTable3email: TWideMemoField;
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  DataModule4: TDataModule4;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

end.
