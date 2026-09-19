unit Unit8;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.Edit, FMX.ListBox,
  FMX.ListView, FMX.TabControl;

type
  TForm8 = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Rectangle4: TRectangle;
    Label6: TLabel;
    Text1: TText;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: WideChar;
      Shift: TShiftState);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form8: TForm8;

implementation

{$R *.fmx}

uses Unit1;

procedure TForm8.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: WideChar; Shift: TShiftState);
begin
  Form1.Back(Self, Key);
end;

end.
