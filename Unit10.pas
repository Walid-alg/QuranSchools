unit Unit10;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.StdCtrls, FMX.Effects, FMX.ListBox, FMX.Edit, FMX.Layouts, FMX.Objects,
  FMX.Ani, FMX.ListView, FMX.TabControl, FMX.Controls.Presentation;

type
  TForm10 = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Label1: TLabel;
    Rectangle4: TRectangle;
    Label6: TLabel;
    Text1: TText;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    ListView1: TListView;
    Layout6: TLayout;
    Circle1: TCircle;
    FloatAnimation1: TFloatAnimation;
    TabItem2: TTabItem;
    VertScrollBox1: TVertScrollBox;
    Layout2: TLayout;
    Rectangle2: TRectangle;
    Image1: TImage;
    Label2: TLabel;
    ListBox1: TListBox;
    TabItem3: TTabItem;
    VertScrollBox2: TVertScrollBox;
    Layout17: TLayout;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Timer1: TTimer;
    Layout7: TLayout;
    Label7: TLabel;
    Edit1: TEdit;
    Layout18: TLayout;
    Label18: TLabel;
    ComboBox4: TComboBox;
    Layout8: TLayout;
    Label8: TLabel;
    ComboBox1: TComboBox;
    Layout9: TLayout;
    Label9: TLabel;
    ComboBox2: TComboBox;
    Layout10: TLayout;
    Label10: TLabel;
    ComboBox3: TComboBox;
    Layout11: TLayout;
    Edit2: TEdit;
    Edit3: TEdit;
    ShadowEffect: TShadowEffect;
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: WideChar;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure Circle1Click(Sender: TObject);
  private
    { DÈclarations privÈes }
  public
    { DÈclarations publiques }
    procedure AnimateCircle;
  end;

var
  Form10: TForm10;

implementation

{$R *.fmx}

uses Unit1, App, Unit4, JavaAPI;

procedure TForm10.AnimateCircle;
begin
  // ≈⁄œ«œ «·‹ Animation
  FloatAnimation1 := TFloatAnimation.Create(Circle1);
  FloatAnimation1.Parent := Circle1;
  FloatAnimation1.PropertyName := 'Position.Y';
  FloatAnimation1.StartValue := Circle1.Position.Y;
  FloatAnimation1.StopValue := Circle1.Position.Y + 20;
  FloatAnimation1.Duration := 0.3;
  FloatAnimation1.AutoReverse := True;
  FloatAnimation1.Loop := False;
  FloatAnimation1.Enabled := False;

  // // ≈⁄œ«œ «·‹ Timer
  // if Assigned(Timer1) then
  // begin
  // Timer1.Free;
  // end;
  Timer1 := TTimer.Create(Self);
  Timer1.Interval := 3000; // ﬂ· 5 ÀÊ«‰Ú
  Timer1.OnTimer := Timer1Timer;
  Timer1.Enabled := True;
end;

procedure TForm10.Circle1Click(Sender: TObject);
begin
  try
    SpeedButton2.Visible := False;
    Form1.ClearInputFields(Self);
    TabControl1.SetActiveTabWithTransition(TabItem3, TTabTransition.Slide);
  Except
    TabControl1.SetActiveTabWithTransition(TabItem1, TTabTransition.Slide);
  end;
end;

procedure TForm10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled := False;
end;

procedure TForm10.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: WideChar; Shift: TShiftState);
begin
  Form1.Back(Self, Key);
end;
procedure TForm10.FormResize(Sender: TObject);
begin
  Circle1.Position.X := Form1.Width - Circle1.Width - 14;
  Circle1.Position.Y := Form1.Height - Circle1.Height - 14;
  Circle1.BringToFront;
end;

procedure TForm10.FormShow(Sender: TObject);
begin
  Self.StyleBook := Form1.StyleBook;
  TabControl1.ActiveTab := TabItem1;
  TTeacher.LoadTeachers(DataModule4.FDTable2, ComboBox4);
  TSpecialty.LoadSpecialtys(DataModule4.FDTable4, ComboBox1);
   var
    screen_width: Single; // ,screen_height
  screen_width := GetScreenWidthPixels;
  Circle1.Position.X := (screen_width / 2) - Circle1.Width;
  Circle1.Position.Y := 0;
  AnimateCircle;
  SpeedButton2.Visible := False;
  Form1.ClearInputFields(Self);
end;

procedure TForm10.Timer1Timer(Sender: TObject);
begin
  FloatAnimation1.Start;
end;

end.
