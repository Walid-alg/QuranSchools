unit Unit5;

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
  TForm5 = class(TForm)
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
    Layout16: TLayout;
    Label16: TLabel;
    Edit10: TEdit;
    Layout18: TLayout;
    Label18: TLabel;
    ComboBox1: TComboBox;
    Layout17: TLayout;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    Timer1: TTimer;
    Layout8: TLayout;
    Label8: TLabel;
    Edit2: TEdit;
    ShadowEffect: TShadowEffect;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: WideChar;
      Shift: TShiftState);
    procedure Circle1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Rectangle2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Edit2ChangeTracking(Sender: TObject);
  private
    { Déclarations privées }
    procedure AnimateCircle;
    procedure Timer1Timer(Sender: TObject);
  public
    { Déclarations publiques }
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}

uses Unit1,
  App,
  JavaAPI,
  Unit4;

procedure TForm5.AnimateCircle;
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

procedure TForm5.Circle1Click(Sender: TObject);
begin
  try
    SpeedButton2.Visible := False;
    Form1.ClearInputFields(Self);
    TabControl1.SetActiveTabWithTransition(TabItem3, TTabTransition.Slide);
  Except
    TabControl1.SetActiveTabWithTransition(TabItem1, TTabTransition.Slide);
  end;
end;

procedure TForm5.Edit2ChangeTracking(Sender: TObject);
begin
  Form1.email_is_match(Edit2, ShadowEffect);
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled := False;
end;

procedure TForm5.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: WideChar; Shift: TShiftState);
begin
  Form1.Back(Self, Key);
end;

procedure TForm5.FormResize(Sender: TObject);
begin
  Circle1.Position.X := Form1.Width - Circle1.Width - 14;
  Circle1.Position.Y := Form1.Height - Circle1.Height - 14;
  Circle1.BringToFront;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
  Self.StyleBook := Form1.StyleBook;
  TabControl1.ActiveTab := TabItem1;
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

procedure TForm5.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var
  LevelValue: string;
  Index: Integer;
  SpecializationID: Integer;
  SpecializationName: string;
  TeacherID: Integer;
  TeacherFullName: string;
begin
  // AnimateLayouts;
  DataModule4.FDTable2.RecNo := ListView1.ItemIndex + 1;
  Edit1.Text := DataModule4.FDTable2.FieldByName('first_name').AsWideString;
  Edit10.Text := DataModule4.FDTable2.FieldByName('last_name').AsWideString;
  Edit6.Text := DataModule4.FDTable2.FieldByName('address').AsWideString;
  Edit5.Text := DataModule4.FDTable2.FieldByName('phone').AsWideString;
  Edit2.Text := DataModule4.FDTable2.FieldByName('email').AsWideString;

  SpecializationID := DataModule4.FDTable2.FieldByName('specialization_id')
    .AsInteger;

  if DataModule4.FDTable4.Locate('id', SpecializationID, []) then
  begin
    // تركيب الاسم الكامل
    SpecializationName := DataModule4.FDTable4.FieldByName('name').AsWideString;

    ComboBox1.Items.Add(SpecializationName);
    ComboBox1.ItemIndex := 0;
  end
  else
  begin
    // لم يتم العثور على الولي
    ComboBox1.ItemIndex := -1;
  end;

  TabControl1.SetActiveTabWithTransition(TabItem2, TTabTransition.Slide);
end;

procedure TForm5.Rectangle2Click(Sender: TObject);
begin
  SpeedButton2.Visible := True;
  TabControl1.SetActiveTabWithTransition(TabItem3, TTabTransition.Slide);
end;

procedure TForm5.SpeedButton1Click(Sender: TObject);
begin
  TTeacher.InsertTeacher(DataModule4.FDTable2, Edit1.Text, // first name
    Edit10.Text, // last name
    Edit6.Text, // address
    Edit5.Text, // phone
    ComboBox1.ItemIndex + 1, Edit2.Text);
{$IFDEF android}
  Toast('تم حفظ التعديلات بنجاح');
{$ELSE}
  ShowMessage('تمت الإضافة بنجاح');
{$ENDIF}
  TabControl1.SetActiveTabWithTransition(TabItem1, TTabTransition.Slide);
  Form1.ClearInputFields(Self);
end;

procedure TForm5.SpeedButton2Click(Sender: TObject);
begin
  TTeacher.DeleteTeacher(DataModule4.FDTable2, TabControl1, TabItem1);
end;

procedure TForm5.Timer1Timer(Sender: TObject);
begin
  FloatAnimation1.Start;
end;

end.
