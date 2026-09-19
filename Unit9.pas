unit Unit9;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.TabControl,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMXTee.Series, FMXTee.Engine, FMXTee.Procs, FMXTee.Chart;

type
  TForm9 = class(TForm)
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
    Chart1: TChart;
    Series1: TLineSeries;
    Chart2: TChart;
    Series2: TPieSeries;
    Layout2: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: WideChar;
      Shift: TShiftState);
  private
    { DÈclarations privÈes }
  public
    { DÈclarations publiques }
    procedure FillStatistics;
  end;

var
  Form9: TForm9;

implementation

{$R *.fmx}

uses Unit1;

{ TForm9 }

procedure TForm9.FillStatistics;
begin
  //  ⁄ÌÌ‰ ⁄œœ «·ÿ·«» Ê„ Ê”ÿ «·€Ì«»
  Label2.Text := '⁄œœ «·ÿ·«»: 120';
  Label5.Text := '„ Ê”ÿ «·€Ì«»: 3.5';

  //  ⁄»∆… „Œÿÿ  ﬁœ„ «·Õ›Ÿ (Line Chart)
  Series1.Clear; // „”Õ «·»Ì«‰«  «·ﬁœÌ„…
  Series1.AddXY(1, 5, 'Ì‰«Ì—');   // 5 ’›Õ«  ›Ì Ì‰«Ì—
  Series1.AddXY(2, 9, '›»—«Ì—');  // 9 ’›Õ«  ›Ì ›»—«Ì—
  Series1.AddXY(3, 6, '„«—”');    // 6 ’›Õ«  ›Ì „«—”
  Series1.AddXY(4, 11, '√»—Ì·');  // 11 ’›Õ… ›Ì √»—Ì·

  //  ⁄»∆… „Œÿÿ „” ÊÌ«  «·Õ›Ÿ (Donut Chart)
  Series2.Clear;
  Series2.Add(50, '„ ﬁœ„'); // 50%
  Series2.Add(30, '„ Ê”ÿ'); // 30%
  Series2.Add(20, '„» œ∆'); // 20%
end;

procedure TForm9.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: WideChar; Shift: TShiftState);
begin
  Form1.Back(Self, Key);
end;

procedure TForm9.FormShow(Sender: TObject);
begin
  Self.StyleBook:=Form1.StyleBook;
  FillStatistics;
end;

end.
