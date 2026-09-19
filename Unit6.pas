unit Unit6;

interface

uses
  System.SysUtils,
  System.Types,
  System.UITypes,
  System.Classes,
  System.Variants,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.Graphics,
  FMX.Dialogs,
  FMX.TabControl,
  FMX.Controls.Presentation,
  FMX.StdCtrls,
  FMX.Objects,
  FMX.Layouts,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.DateTimeCtrls,
  FMX.ListBox,
  FMX.Edit,
  FMX.Ani,
  FMX.ListView,
  System.Rtti,
  System.Bindings.Outputs,
  FMX.Bind.Editors,
  Data.Bind.EngExt,
  FMX.Bind.DBEngExt,
  Data.Bind.Components,
  Data.Bind.DBScope,
  FMX.Effects,
  gtClasses;

type
  TForm6 = class(TForm)
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
    Layout3: TLayout;
    Rectangle3: TRectangle;
    Image2: TImage;
    Label3: TLabel;
    ListBox1: TListBox;
    Layout4: TLayout;
    Rectangle5: TRectangle;
    Image3: TImage;
    Label4: TLabel;
    Layout5: TLayout;
    Rectangle6: TRectangle;
    Image4: TImage;
    Label5: TLabel;
    TabItem3: TTabItem;
    VertScrollBox2: TVertScrollBox;
    Layout7: TLayout;
    Label7: TLabel;
    Edit1: TEdit;
    Layout11: TLayout;
    Label11: TLabel;
    Edit5: TEdit;
    Layout12: TLayout;
    Label12: TLabel;
    Edit6: TEdit;
    Layout13: TLayout;
    Label13: TLabel;
    Edit7: TEdit;
    Layout15: TLayout;
    Label15: TLabel;
    Layout16: TLayout;
    Label16: TLabel;
    Edit10: TEdit;
    Layout17: TLayout;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    Timer1: TTimer;
    ComboBox5: TComboBox;
    ShadowEffect: TShadowEffect;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: WideChar;
      Shift: TShiftState);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Circle1Click(Sender: TObject);
    procedure Rectangle2Click(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Edit7ChangeTracking(Sender: TObject);
  private
    { Déclarations privées }
    procedure AnimateCircle;
    procedure Timer1Timer(Sender: TObject);
  public
    { Déclarations publiques }
  end;

var
  Form6: TForm6;

implementation

{$R *.fmx}

uses Unit1,
  App,
  JavaAPI,
  Unit4;

procedure TForm6.AnimateCircle;
begin
  // إعداد الـ Animation
  FloatAnimation1 := TFloatAnimation.Create(Circle1);
  FloatAnimation1.Parent := Circle1;
  FloatAnimation1.PropertyName := 'Position.Y';
  FloatAnimation1.StartValue := Circle1.Position.Y;
  FloatAnimation1.StopValue := Circle1.Position.Y + 20;
  FloatAnimation1.Duration := 0.3;
  FloatAnimation1.AutoReverse := True;
  FloatAnimation1.Loop := False;
  FloatAnimation1.Enabled := False;

  // // إعداد الـ Timer
  // if Assigned(Timer1) then
  // begin
  // Timer1.Free;
  // end;
  Timer1 := TTimer.Create(Self);
  Timer1.Interval := 3000; // كل 5 ثوانٍ
  Timer1.OnTimer := Timer1Timer;
  Timer1.Enabled := True;
end;

procedure TForm6.Circle1Click(Sender: TObject);
begin
  try
    SpeedButton2.Visible := False;
    Form1.ClearInputFields(Self);
    TabControl1.SetActiveTabWithTransition(TabItem3, TTabTransition.Slide);
  Except
    TabControl1.SetActiveTabWithTransition(TabItem1, TTabTransition.Slide);
  end;
end;

procedure TForm6.Edit7ChangeTracking(Sender: TObject);
begin
  Form1.email_is_match(Edit7, ShadowEffect);
end;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled := False;
end;

procedure TForm6.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: WideChar; Shift: TShiftState);
begin
  Form1.Back(Self, Key);
end;

procedure TForm6.FormResize(Sender: TObject);
begin
  Circle1.Position.X := Form1.Width - Circle1.Width - 14;
  Circle1.Position.Y := Form1.Height - Circle1.Height - 14;
  Circle1.BringToFront;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
  Self.StyleBook := Form1.StyleBook;
  TabControl1.ActiveTab := TabItem1;

  var
    screen_width: Single; // ,screen_height
  screen_width := GetScreenWidthPixels;
  Circle1.Position.X := (screen_width / 2) - Circle1.Width;
  Circle1.Position.Y := 0;
  AnimateCircle;
  SpeedButton2.Visible := False;
  Form1.ClearInputFields(Self);
end;

procedure TForm6.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin
  // AnimateLayouts;
  DataModule4.FDTable3.RecNo := ListView1.ItemIndex + 1;
  Edit1.Text := DataModule4.FDTable3.FieldByName('first_name').AsWideString;
  Edit10.Text := DataModule4.FDTable3.FieldByName('last_name').AsWideString;
  ComboBox5.ItemIndex := ComboBox5.Items.IndexOf
    (DataModule4.FDTable3.FieldByName('relationship').AsWideString);
  Edit6.Text := DataModule4.FDTable3.FieldByName('address').AsWideString;
  Edit5.Text := DataModule4.FDTable3.FieldByName('phone').AsWideString;
  Edit7.Text := DataModule4.FDTable3.FieldByName('email').AsWideString;

  TabControl1.SetActiveTabWithTransition(TabItem2, TTabTransition.Slide);
end;

procedure TForm6.Rectangle2Click(Sender: TObject);
begin
  SpeedButton2.Visible := True;
  TabControl1.SetActiveTabWithTransition(TabItem3, TTabTransition.Slide);
end;

procedure TForm6.SpeedButton1Click(Sender: TObject);
begin
  TGuardian.InsertGuardian(DataModule4.FDTable2, Edit1.Text, // first name
    Edit10.Text, // last name
    ComboBox5.Items[ComboBox5.ItemIndex], Edit6.Text, // address
    Edit5.Text, // phone
    Edit7.Text);
{$IFDEF android}
  Toast('تم حفظ التعديلات بنجاح');
{$ELSE}
  ShowMessage('تمت الإضافة بنجاح');
{$ENDIF}
  TabControl1.SetActiveTabWithTransition(TabItem1, TTabTransition.Slide);
  Form1.ClearInputFields(Self);
end;

procedure TForm6.SpeedButton2Click(Sender: TObject);
begin
  TGuardian.DeleteGuardian(DataModule4.FDTable3, TabControl1, TabItem1);
end;

procedure TForm6.Timer1Timer(Sender: TObject);
begin
  FloatAnimation1.Start;
end;

end.
