unit Unit3;

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
  FMX.ListBox,
  FMX.ListView.Types,
  FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base,
  FMX.ListView,
  FMX.Ani,
  FMX.DateTimeCtrls,
  FMX.Edit,
  Data.Bind.Components,
  Data.Bind.DBScope,
  System.Rtti,
  System.Bindings.Outputs,
  FMX.Bind.Editors,
  Data.Bind.EngExt,
  FMX.Bind.DBEngExt,
  System.ImageList,
  FMX.ImgList,
  FMX.Effects,
  gtClasses, FMX.SearchBox, System.Math.Vectors, FMX.Controls3D, FMX.Layers3D,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
  TForm3 = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Label1: TLabel;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    TabItem3: TTabItem;
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
    Rectangle4: TRectangle;
    Label6: TLabel;
    ListView1: TListView;
    Circle1: TCircle;
    Layout6: TLayout;
    FloatAnimation1: TFloatAnimation;
    Text1: TText;
    VertScrollBox2: TVertScrollBox;
    Layout7: TLayout;
    Label7: TLabel;
    Edit1: TEdit;
    Layout8: TLayout;
    Label8: TLabel;
    Layout9: TLayout;
    Label9: TLabel;
    Layout10: TLayout;
    Label10: TLabel;
    Layout11: TLayout;
    Label11: TLabel;
    Edit5: TEdit;
    Layout12: TLayout;
    Label12: TLabel;
    Edit6: TEdit;
    Layout13: TLayout;
    Label13: TLabel;
    Edit7: TEdit;
    Layout14: TLayout;
    Label14: TLabel;
    Layout15: TLayout;
    Label15: TLabel;
    Layout16: TLayout;
    Label16: TLabel;
    Edit10: TEdit;
    Layout18: TLayout;
    Label18: TLabel;
    DateEdit1: TDateEdit;
    ComboBox1: TComboBox;
    DateEdit2: TDateEdit;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Layout17: TLayout;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    BindSourceDB1: TBindSourceDB;
    Timer1: TTimer;
    Layout19: TLayout;
    Label17: TLabel;
    Edit2: TEdit;
    Label19: TLabel;
    TabItem4: TTabItem;
    TabItem5: TTabItem;
    ListBox2: TListBox;
    SearchBox1: TSearchBox;
    LinkListControlToField2: TLinkListControlToField;
    Layout20: TLayout;
    Edit3: TEdit;
    SearchEditButton1: TSearchEditButton;
    Layout3D1: TLayout3D;
    Layout21: TLayout;
    Layout22: TLayout;
    Layout23: TLayout;
    Layout24: TLayout;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    ComboBox5: TComboBox;
    Label20: TLabel;
    DateEdit3: TDateEdit;
    Label21: TLabel;
    ComboBox6: TComboBox;
    Label22: TLabel;
    Layout25: TLayout;
    ComboBox7: TComboBox;
    Label23: TLabel;
    Edit4: TEdit;
    Layout26: TLayout;
    ComboBox8: TComboBox;
    Label24: TLabel;
    Layout27: TLayout;
    DateEdit4: TDateEdit;
    Label25: TLabel;
    Layout28: TLayout;
    Label26: TLabel;
    ComboBox9: TComboBox;
    Layout29: TLayout;
    Panel1: TPanel;
    Edit8: TEdit;
    Edit9: TEdit;
    Layout30: TLayout;
    Edit11: TEdit;
    Label27: TLabel;
    Layout31: TLayout;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    Memo1: TMemo;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    ShadowEffect3: TShadowEffect;
    ShadowEffect4: TShadowEffect;
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: WideChar;
      Shift: TShiftState);
    procedure TabControl1Changing(Sender: TObject; var AAllowChange: Boolean);
    procedure Circle1Click(Sender: TObject);
    procedure TabItem2Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure TabItem1Click(Sender: TObject);
    procedure TabItem3Click(Sender: TObject);
    procedure Edit1Enter(Sender: TObject);
    procedure Edit10Enter(Sender: TObject);
    procedure DateEdit1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DateEdit1Enter(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure Edit7Enter(Sender: TObject);
    procedure Edit6Enter(Sender: TObject);
    procedure Edit5Enter(Sender: TObject);
    procedure DateEdit2Enter(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure ListView1ItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Rectangle2Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit2ChangeTracking(Sender: TObject);
    procedure Rectangle5Click(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
    procedure ListBox2ItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
  private
    { Déclarations privées }
    // procedure AnimateLayouts;
    procedure AnimFinishHandler(Sender: TObject);
    procedure AnimateLayoutMove(Layout: TLayout; TargetY: Single;
      Delay: Single = 0.0; Duration: Single = 0.4; OnFinishProc: TProc = nil);
    procedure AnimateLayouts;
    procedure AnimateRectangleColor(Rect: TRectangle);
    function GetRandomColor: TAlphaColor;
    procedure AnimateCircle;
    procedure Timer1Timer(Sender: TObject);
    procedure AnimateTextDropFromText;
    procedure AnimateTextDropFromRightToLeft;
    procedure AnimFinishedHandler1(Sender: TObject);
    procedure AnimFinishedHandler2(Sender: TObject);
    procedure ScrollIntoView(ScrollBox: TVertScrollBox); // Control: TControl;
    procedure ScrollToNextControl(ScrollBox: TVertScrollBox);
  public
    { Déclarations publiques }
  end;

var
  Form3: TForm3;

var
  GOnFinishProc: TProc;

  // scrol:Single=100;
var
  CurrentIndex: Integer = 0;

implementation

{$R *.fmx}

uses Unit1,
  JavaAPI,
  DateUtils,
  Unit4,
  App;

// procedure TForm3.AnimateLayouts;
// const
// StartY = 600; // مكان البداية أسفل الشاشة تقريبًا (حسب حجم الشاشة لديك)
// LayoutHeight = 80;
// Duration = 0.4; // مدة كل حركة بالثواني
// begin
// // وضع جميع الـ Layouts أسفل الشاشة في البداية
// Layout2.Position.Y := StartY;
// Layout3.Position.Y := StartY;
// Layout4.Position.Y := StartY;
// Layout5.Position.Y := StartY;
//
// // حرك Layout2 إلى مكانه
// TAnimator.AnimateFloat(Layout2, 'Position.Y', StartY - LayoutHeight * 1, Duration,
// TAnimationType.InOut, TInterpolationType.Linear,
// procedure
// begin
// // بعد انتهاء حركة Layout2، حرك Layout3
// TAnimator.AnimateFloat(Layout3, 'Position.Y', StartY - LayoutHeight * 2, Duration,
// TAnimationType.InOut, TInterpolationType.Linear,
// procedure
// begin
// // بعد انتهاء حركة Layout3، حرك Layout4
// TAnimator.AnimateFloat(Layout4, 'Position.Y', StartY - LayoutHeight * 3, Duration,
// TAnimationType.InOut, TInterpolationType.Linear,
// procedure
// begin
// // وأخيراً حرك Layout5
// TAnimator.AnimateFloat(Layout5, 'Position.Y', StartY - LayoutHeight * 4, Duration,
// TAnimationType.InOut, TInterpolationType.Linear);
// end);
// end);
// end);
// end;

// procedure AnimateLayoutUp(Layout: TLayout; NewY: Single; Duration: Single; OnFinishProc: TProc = nil);
// var
// Anim: TFloatAnimation;
// begin
// Anim := TFloatAnimation.Create(Layout);
// Anim.Parent := Layout;
// Anim.PropertyName := 'Position.Y';
// Anim.StartValue := Layout.Position.Y;
// Anim.StopValue := NewY;
// Anim.Duration := Duration;
// Anim.AnimationType := TAnimationType.In;
// Anim.Interpolation := TInterpolationType.Linear;
// Anim.OnFinish :=
// procedure(Sender: TObject)
// begin
// if Assigned(OnFinishProc) then
// OnFinishProc();
// Anim.DisposeOf;
// end;
// Anim.Start;
// end;

procedure TForm3.AnimateCircle;
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

procedure TForm3.AnimateLayoutMove(Layout: TLayout; TargetY: Single;
  Delay: Single = 0.0; Duration: Single = 0.4; OnFinishProc: TProc = nil);
var
  Anim: TFloatAnimation;
begin
  Anim := TFloatAnimation.Create(Layout);
  Anim.Parent := Layout;
  Anim.PropertyName := 'Position.Y';
  Anim.StartValue := Layout.Position.Y;
  Anim.StopValue := TargetY;
  Anim.Duration := Duration;
  Anim.Delay := Delay;
  Anim.AnimationType := TAnimationType.In;
  Anim.Interpolation := TInterpolationType.Linear;

  // احفظ الإجراء المجهول في متغير عام
  GOnFinishProc := OnFinishProc;

  Anim.OnFinish := AnimFinishHandler;
  Anim.Start;
end;

// procedure TForm3.AnimateLayouts;
// begin
// Layout2.Position.Y := ClientHeight;
// Layout3.Position.Y := ClientHeight;
// Layout4.Position.Y := ClientHeight;
// Layout5.Position.Y := ClientHeight;
//
// AnimateLayoutMove(Layout2, ClientHeight - 80, 0.0);
// AnimateLayoutMove(Layout3, ClientHeight - 160, 0.2);
// AnimateLayoutMove(Layout4, ClientHeight - 240, 0.4);
// AnimateLayoutMove(Layout5, ClientHeight - 320, 0.6
// ,0.6,
// procedure
// begin
// ShowMessage('التحريك انتهى');
// end);
// end;
procedure TForm3.AnimateLayouts;
begin

  // نضعهم خارج الشاشة أولاً (أعلى الشاشة)
  Layout2.Position.Y := -Layout2.Height;
  Layout3.Position.Y := -Layout3.Height;
  Layout4.Position.Y := -Layout4.Height;
  Layout5.Position.Y := -Layout5.Height;

  // نحركهم واحداً تلو الآخر للأسفل من أعلى الشاشة بترتيب مناسب
  AnimateLayoutMove(Layout2, 0, 0.0);
  AnimateLayoutMove(Layout3, Layout2.Height + 10, 0.2);
  // تحت Layout2 بمقدار 10 بكسل
  AnimateLayoutMove(Layout4, Layout2.Height + Layout3.Height + 20, 0.4);
  // أسفلهما
  AnimateLayoutMove(Layout5, Layout2.Height + Layout3.Height + Layout4.Height
    + 30, 0.6);
  // procedure
  // begin
  // ShowMessage('التحريك انتهى');
  // end);
  AnimateRectangleColor(Rectangle2);
  AnimateRectangleColor(Rectangle3);
  AnimateRectangleColor(Rectangle5);
  AnimateRectangleColor(Rectangle6);
end;

procedure TForm3.AnimateRectangleColor(Rect: TRectangle);
var
  Anim: TColorAnimation;
begin
  Randomize;
  // إنشاء العنصر
  Anim := TColorAnimation.Create(Rect);
  Anim.Parent := Rect;
  Anim.PropertyName := 'Fill.Color'; // الخاصية التي سيتم تحريكها
  Anim.StartValue := Rect.Fill.Color; // اللون الحالي
  Anim.StopValue := GetRandomColor; // اللون النهائي (عشوائي)
  Anim.Duration := 1.0; // مدة التحريك بالثواني
  Anim.Interpolation := TInterpolationType.Linear; // نوع الانتقال
  Anim.Loop := False;
  Anim.AutoReverse := False;
  Anim.Start; // تشغيل التحريك
end;

procedure TForm3.AnimateTextDropFromText;
var
  I: Integer;
  CharText: string;
  CharControl: TText;
  Anim: TFloatAnimation;
  StartX, StartY: Single;
begin
  StartX := Text1.Position.X;
  StartY := Text1.Position.Y;
  Text1.Visible := False;
  for I := 0 to Text1.Text.Length - 1 do
  begin
    CharText := Text1.Text.Substring(I, 1);

    // إنشاء TText لكل حرف
    CharControl := TText.Create(Self);
    CharControl.Parent := Self;
    CharControl.Text := CharText;
    CharControl.Position.X := StartX + (I * 20); // تباعد الحروف
    CharControl.Position.Y := StartY;
    CharControl.Font.Size := Text1.Font.Size;
    CharControl.Font.Family := Text1.Font.Family;
    // CharControl.Fill := Text1.Fill;
    CharControl.Opacity := 1;

    // إنشاء الأنميشن
    Anim := TFloatAnimation.Create(CharControl);
    Anim.Parent := CharControl;
    Anim.PropertyName := 'Position.Y';
    Anim.StartValue := CharControl.Position.Y;
    Anim.StopValue := CharControl.Position.Y + 100;
    Anim.Duration := 0.6;
    Anim.Delay := I * 0.1;
    Anim.Interpolation := TInterpolationType.Cubic;
    Anim.AnimationType := TAnimationType.InOut;

    // ربط كل أنميشن بمعالج انتهاء مختلف
    case I mod 2 of
      0:
        Anim.OnFinish := AnimFinishedHandler1;
      1:
        Anim.OnFinish := AnimFinishedHandler2;
    end;

    Anim.Start;
  end;
end;

procedure TForm3.AnimateTextDropFromRightToLeft;
var
  I: Integer;
  CharText: string;
  CharControl: TText;
  Anim: TFloatAnimation;
  StartX, StartY: Single;
  TotalWidth: Single;
begin
  StartX := Text1.Position.X;
  StartY := Text1.Position.Y;
  Text1.Visible := False;

  // نحسب عرض السلسلة النصية بالكامل
  TotalWidth := Text1.Text.Length * 20;

  for I := 0 to Text1.Text.Length - 1 do
  begin
    CharText := Text1.Text.Substring(I, 1);

    // إنشاء TText لكل حرف
    CharControl := TText.Create(Self);
    CharControl.Parent := Self;
    CharControl.Text := CharText;

    // نضع الحرف من اليمين إلى اليسار
    CharControl.Position.X := StartX + TotalWidth - ((I + 1) * 20);
    CharControl.Position.Y := StartY;

    CharControl.Font.Size := Text1.Font.Size;
    CharControl.Font.Family := Text1.Font.Family;
    CharControl.Color := Text1.Color;
    // CharControl.Color:=TAlphaColorRec.Teal;
    CharControl.Opacity := 1;

    // إنشاء الأنميشن
    Anim := TFloatAnimation.Create(CharControl);
    Anim.Parent := CharControl;
    Anim.PropertyName := 'Position.Y';
    Anim.StartValue := CharControl.Position.Y;
    Anim.StopValue := CharControl.Position.Y + 100;
    Anim.Duration := 0.6;
    Anim.Delay := I * 0.1;
    Anim.Interpolation := TInterpolationType.Cubic;
    Anim.AnimationType := TAnimationType.InOut;

    // ربط كل أنميشن بمعالج انتهاء مختلف
    case I mod 2 of
      0:
        Anim.OnFinish := AnimFinishedHandler1;
      1:
        Anim.OnFinish := AnimFinishedHandler2;
    end;

    Anim.Start;
  end;
end;

procedure TForm3.AnimFinishedHandler1(Sender: TObject);
var
  A: TFloatAnimation;
  T: TText;
begin
  A := TFloatAnimation(Sender);
  T := TText(A.Parent);
  T.Visible := False;
  T.Free;
end;

procedure TForm3.AnimFinishedHandler2(Sender: TObject);
begin
  AnimFinishedHandler1(Sender); // إعادة استخدام نفس الكود
end;

procedure TForm3.AnimFinishHandler(Sender: TObject);
begin
  if Assigned(GOnFinishProc) then
    GOnFinishProc();

  (Sender as TFloatAnimation).Free;
end;

procedure TForm3.Circle1Click(Sender: TObject);
begin
  try
    SpeedButton2.Visible := False;
    Form1.ClearInputFields(Self);
    TabControl1.SetActiveTabWithTransition(TabItem3, TTabTransition.Slide);
  Except
    TabControl1.SetActiveTabWithTransition(TabItem1, TTabTransition.Slide);
  end;
end;

procedure TForm3.ComboBox1Enter(Sender: TObject);
begin
  // VertScrollBox2.ScrollBy(0, -50);
end;

procedure TForm3.ComboBox2Enter(Sender: TObject);
begin
  // VertScrollBox2.ScrollBy(0, -50);
end;

procedure TForm3.DateEdit1Change(Sender: TObject);
  function DiffaWithTime(const DT1, DT2: TDateTime): string;
  var
    Y, M, D: Word;
    H, Min, S: Word;
    TempDate: TDateTime;
    TotalSeconds: Integer;
  begin
    if DT1 > DT2 then
    begin
      ShowMessage('التاريخ غير صحيح');
      // toast message
      // Abort;
      Exit;
    end;
    Y := YearsBetween(DT2, DT1);
    TempDate := IncYear(DT1, Y);
    M := MonthsBetween(DT2, TempDate);
    TempDate := IncMonth(TempDate, M);
    D := DaysBetween(DT2, TempDate);
    TempDate := IncDay(TempDate, D);
    TotalSeconds := SecondsBetween(DT2, TempDate);

    H := TotalSeconds div 3600;
    Min := (TotalSeconds mod 3600) div 60;
    S := (TotalSeconds mod 60);

    // Result := Format('%d An %d mois %d jours %d heures %d minutes %d secondes.',
    // [Y, M, D, H, Min, S]);
    Result := Format('%d', [Y]);
  end;

begin
  Edit7.Text := DiffaWithTime(DateEdit1.Date, now);
  Label19.Text := DiffaWithTime(DateEdit1.Date, now);
end;

procedure TForm3.DateEdit1Enter(Sender: TObject);
begin
  // VertScrollBox2.ScrollBy(0, -50);
end;

procedure TForm3.DateEdit2Enter(Sender: TObject);
begin
  // VertScrollBox2.ScrollBy(0, -50);
end;

procedure TForm3.Edit10Enter(Sender: TObject);
begin
  // ScrollIntoView(Edit10, VertScrollBox1);
  // VertScrollBox2.ScrollBy(0, -50);
end;

procedure TForm3.Edit1Enter(Sender: TObject);
// var
// LEditTop, LVisibleTop: Single;
begin
  // // إحداثي Top الخاص بـ Edit1 داخل ScrollBox
  // LEditTop := Edit1.Position.Y + Edit1.Height;
  //
  // // موضع العرض الحالي (أين وصل ScrollBox حاليا)
  // LVisibleTop := VertScrollBox1.ViewportPosition.Y + VertScrollBox1.Height;
  //
  // // إذا لم يكن Edit1 ظاهرًا، نمرر للأسفل
  // if LEditTop > LVisibleTop then
  // VertScrollBox1.ScrollBy(0, LEditTop - LVisibleTop + 20); // +20 كـ هامش بسيط
  // VertScrollBox2.ScrollBy(0, -50);
end;

procedure TForm3.Edit2ChangeTracking(Sender: TObject);
begin
  Form1.email_is_match(Edit2, ShadowEffect4);
end;

procedure TForm3.Edit5Enter(Sender: TObject);
begin
  // VertScrollBox2.ScrollBy(0, -50);
end;

procedure TForm3.Edit6Enter(Sender: TObject);
begin
  // VertScrollBox2.ScrollBy(0, -50);
end;

procedure TForm3.Edit7Enter(Sender: TObject);
begin
  // VertScrollBox2.ScrollBy(0, -50);
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled := False;
end;

procedure TForm3.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: WideChar; Shift: TShiftState);
begin
  Form1.Back(Self, Key);
  // Timer1.Free;
end;

procedure TForm3.FormResize(Sender: TObject);
begin
  Circle1.Position.X := Form1.Width - Circle1.Width - 14;
  Circle1.Position.Y := Form1.Height - Circle1.Height - 14;
  Circle1.BringToFront;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  Self.StyleBook := Form1.StyleBook;
  TabControl1.ActiveTab := TabItem1;
  TTeacher.LoadTeachers(DataModule4.FDTable2, ComboBox4);
  TGuardian.LoadGuardians(DataModule4.FDTable3, ComboBox3);
  // Form1.activeTable(DataModule4.FDTable1);
  // Form1.activeTable(DataModule4.FDTable2);
  // Form1.activeTable(DataModule4.FDTable3);
  var
    screen_width: Single; // ,screen_height
  screen_width := GetScreenWidthPixels;
  Circle1.Position.X := (screen_width / 2) - Circle1.Width;
  Circle1.Position.Y := 0;
  AnimateCircle;
  SpeedButton2.Visible := False;
  Form1.ClearInputFields(Self);
end;

function TForm3.GetRandomColor: TAlphaColor;
var
  R, G, B: Byte;
begin
  R := Random(256); // قيمة من 0 إلى 255
  G := Random(256);
  B := Random(256);

  // دمج اللون مع الشفافية 100% ($FF)
  Result := TAlphaColor($FF shl 24 or R shl 16 or G shl 8 or B);
end;

procedure TForm3.ListBox2ItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
var
  LevelValue: string;
  Index: Integer;
  GuardianID: Integer;
  GuardianFullName: string;
  TeacherID: Integer;
  TeacherFullName: string;
begin
  AnimateLayouts;
  DataModule4.FDTable1.RecNo := ListBox2.ItemIndex + 1;
  // DataModule4.FDTable1.RecNo:=ListView1.ItemIndex;
  Edit1.Text := DataModule4.FDTable1.FieldByName('first_name').AsWideString;
  Edit10.Text := DataModule4.FDTable1.FieldByName('last_name').AsWideString;
  DateEdit1.Text := DateToStr(DataModule4.FDTable1.FieldByName('birth_date')
    .AsDateTime);
  Edit7.Text := DataModule4.FDTable1.FieldByName('age').AsInteger.ToString;
  Edit6.Text := DataModule4.FDTable1.FieldByName('address').AsWideString;
  ComboBox1.ItemIndex := ComboBox1.Items.IndexOf
    (DataModule4.FDTable1.FieldByName('gender').AsWideString);
  Edit5.Text := DataModule4.FDTable1.FieldByName('phone').AsWideString;
  Edit2.Text := DataModule4.FDTable1.FieldByName('email').AsWideString;
  DateEdit2.Text := DateToStr(DataModule4.FDTable1.FieldByName
    ('enrollment_date').AsDateTime);
  ComboBox2.ItemIndex := ComboBox2.Items.IndexOf
    (DataModule4.FDTable1.FieldByName('level').AsWideString);
  // جلب القيمة من قاعدة البيانات
  LevelValue := DataModule4.FDTable1.FieldByName('level').AsWideString;
  // البحث عن القيمة داخل عناصر ComboBox2
  Index := ComboBox2.Items.IndexOf(LevelValue);

  // إذا وُجدت القيمة ضمن العناصر، تعيينها كمختارة
  if Index <> -1 then
    ComboBox2.ItemIndex := Index;

  // جلب رقم الولي من جدول الطلاب
  GuardianID := DataModule4.FDTable1.FieldByName('guardian_id').AsInteger;

  // البحث عن الولي في جدول الأولياء حسب ID
  if DataModule4.FDTable3.Locate('id', GuardianID, []) then
  begin
    // تركيب الاسم الكامل
    GuardianFullName := DataModule4.FDTable3.FieldByName('first_name').AsString
      + ' ' + DataModule4.FDTable3.FieldByName('last_name').AsString;

    // تعيين الاسم في ComboBox3
    // ComboBox3.ItemIndex := ComboBox3.Items.IndexOf(GuardianFullName);
    ComboBox3.Items.Add(GuardianFullName);
    ComboBox3.ItemIndex := 0;
  end
  else
  begin
    // لم يتم العثور على الولي
    ComboBox3.ItemIndex := -1;
  end;

  TeacherID := DataModule4.FDTable1.FieldByName('teacher_id').AsInteger;

  if DataModule4.FDTable2.Locate('id', TeacherID, []) then
  begin
    // تركيب الاسم الكامل
    TeacherFullName := DataModule4.FDTable2.FieldByName('first_name').AsString +
      ' ' + DataModule4.FDTable2.FieldByName('last_name').AsString;

    ComboBox4.Items.Add(TeacherFullName);
    ComboBox4.ItemIndex := 0;
  end
  else
  begin
    // لم يتم العثور على الولي
    ComboBox4.ItemIndex := -1;
  end;

  TabControl1.SetActiveTabWithTransition(TabItem2, TTabTransition.Slide);
end;

procedure TForm3.ListView1ItemClick(const Sender: TObject;
  const AItem: TListViewItem);
var
  LevelValue: string;
  Index: Integer;
  GuardianID: Integer;
  GuardianFullName: string;
  TeacherID: Integer;
  TeacherFullName: string;
begin
  AnimateLayouts;
  DataModule4.FDTable1.RecNo := ListView1.ItemIndex + 1;
  // DataModule4.FDTable1.RecNo:=ListView1.ItemIndex;
  Edit1.Text := DataModule4.FDTable1.FieldByName('first_name').AsWideString;
  Edit10.Text := DataModule4.FDTable1.FieldByName('last_name').AsWideString;
  DateEdit1.Text := DateToStr(DataModule4.FDTable1.FieldByName('birth_date')
    .AsDateTime);
  Edit7.Text := DataModule4.FDTable1.FieldByName('age').AsInteger.ToString;
  Edit6.Text := DataModule4.FDTable1.FieldByName('address').AsWideString;
  ComboBox1.ItemIndex := ComboBox1.Items.IndexOf
    (DataModule4.FDTable1.FieldByName('gender').AsWideString);
  Edit5.Text := DataModule4.FDTable1.FieldByName('phone').AsWideString;
  Edit2.Text := DataModule4.FDTable1.FieldByName('email').AsWideString;
  DateEdit2.Text := DateToStr(DataModule4.FDTable1.FieldByName
    ('enrollment_date').AsDateTime);
  ComboBox2.ItemIndex := ComboBox2.Items.IndexOf
    (DataModule4.FDTable1.FieldByName('level').AsWideString);
  // جلب القيمة من قاعدة البيانات
  LevelValue := DataModule4.FDTable1.FieldByName('level').AsWideString;
  // البحث عن القيمة داخل عناصر ComboBox2
  Index := ComboBox2.Items.IndexOf(LevelValue);

  // إذا وُجدت القيمة ضمن العناصر، تعيينها كمختارة
  if Index <> -1 then
    ComboBox2.ItemIndex := Index;

  // جلب رقم الولي من جدول الطلاب
  GuardianID := DataModule4.FDTable1.FieldByName('guardian_id').AsInteger;

  // البحث عن الولي في جدول الأولياء حسب ID
  if DataModule4.FDTable3.Locate('id', GuardianID, []) then
  begin
    // تركيب الاسم الكامل
    GuardianFullName := DataModule4.FDTable3.FieldByName('first_name').AsString
      + ' ' + DataModule4.FDTable3.FieldByName('last_name').AsString;

    // تعيين الاسم في ComboBox3
    // ComboBox3.ItemIndex := ComboBox3.Items.IndexOf(GuardianFullName);
    ComboBox3.Items.Add(GuardianFullName);
    ComboBox3.ItemIndex := 0;
  end
  else
  begin
    // لم يتم العثور على الولي
    ComboBox3.ItemIndex := -1;
  end;

  TeacherID := DataModule4.FDTable1.FieldByName('teacher_id').AsInteger;

  if DataModule4.FDTable2.Locate('id', TeacherID, []) then
  begin
    // تركيب الاسم الكامل
    TeacherFullName := DataModule4.FDTable2.FieldByName('first_name').AsString +
      ' ' + DataModule4.FDTable2.FieldByName('last_name').AsString;

    ComboBox4.Items.Add(TeacherFullName);
    ComboBox4.ItemIndex := 0;
  end
  else
  begin
    // لم يتم العثور على الولي
    ComboBox4.ItemIndex := -1;
  end;

  TabControl1.SetActiveTabWithTransition(TabItem2, TTabTransition.Slide);
end;

procedure TForm3.Rectangle2Click(Sender: TObject);
begin
  SpeedButton2.Visible := True;
  TabControl1.SetActiveTabWithTransition(TabItem3, TTabTransition.Slide);
end;

procedure TForm3.Rectangle3Click(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabItem5, TTabTransition.Slide);
end;

procedure TForm3.Rectangle5Click(Sender: TObject);
begin
  TabControl1.SetActiveTabWithTransition(TabItem4, TTabTransition.Slide);
end;

procedure TForm3.ScrollIntoView(ScrollBox: TVertScrollBox);
// Control: TControl;
// var
// ControlBottom, ViewBottom: Single;
begin
  // ControlBottom := Control.Position.Y + Control.Height;
  // ViewBottom := ScrollBox.ViewportPosition.Y + ScrollBox.Height;
  //
  // if ControlBottom > ViewBottom then
  // ScrollBox.ScrollBy(0, ControlBottom - ViewBottom + 20);
  ScrollBox.ScrollBy(0, -50);
end;

procedure TForm3.ScrollToNextControl(ScrollBox: TVertScrollBox);
var
  NextY, ViewBottom: Single;
begin
  // نحسب موضع العنصر التالي بناءً على الفهرس الحالي
  NextY := (CurrentIndex + 1) * 50;

  // نزيد الفهرس حتى ننتقل للعنصر التالي في المرة القادمة
  Inc(CurrentIndex);

  // حساب نهاية المنظور الحالي
  ViewBottom := ScrollBox.ViewportPosition.Y + ScrollBox.Height;

  // إذا كان العنصر التالي خارج العرض، مرّر إليه
  if NextY > ViewBottom then
    ScrollBox.ScrollBy(0, NextY - ViewBottom + 10); // +10 هامش بسيط
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
  // VertScrollBox2.ScrollBy(0, -scrol); // لاحظ الإشارة السالبة هنا
  // scrol := scrol + 50;
  // ScrollToNextControl(VertScrollBox2);
  // VertScrollBox2.ScrollBy(0, -50);
  // DataModule4.FDTable1.Append;
  // with DataModule4.FDTable1 do
  // begin
  // FieldByName('first_name').AsWideString := Edit1.Text;
  // FieldByName('last_name').AsWideString := Edit10.Text;
  // FieldByName('birth_date').AsDateTime := DateEdit1.Date;
  // FieldByName('age').AsInteger := Edit7.Text.ToInteger;
  // FieldByName('address').AsWideString := Edit6.Text;
  // FieldByName('gender').AsWideString := ComboBox1.Text;
  // FieldByName('phone').AsString := Edit5.Text;
  // FieldByName('enrollment_date').AsDateTime := DateEdit2.Date;
  // FieldByName('level').AsWideString := ComboBox2.Text;
  // if ComboBox3.ItemIndex>-1 then
  // begin
  // FieldByName('guardian_id').AsInteger :=integer (ComboBox3.ItemIndex+1);
  // end;
  // if ComboBox4.ItemIndex>-1 then
  // begin
  // FieldByName('teacher_id').AsInteger :=integer (ComboBox4.ItemIndex)+1;
  // end;
  // Post;
  // end;
  // ShowMessage('تمت الإضافة بنجاح');
  // TabControl1.SetActiveTabWithTransition(TabItem1, TTabTransition.Slide);
  TStudent.InsertStudent(DataModule4.FDTable1, Edit1.Text, // first name
    Edit10.Text, // last name
    DateEdit1.Date, // birth date
    StrToInt(Edit7.Text), // age
    Edit6.Text, // address
    ComboBox1.Text, // gender
    Edit5.Text, // phone
    DateEdit2.Date, // enrollment date
    ComboBox2.Text, // level
    ComboBox3.ItemIndex + 1, // guardian id
    ComboBox4.ItemIndex + 1, // teacher id
    Edit2.Text);
{$IFDEF android}
  Toast('تم حفظ التعديلات بنجاح');
{$ELSE}
  ShowMessage('تمت الإضافة بنجاح');
{$ENDIF}
  TabControl1.SetActiveTabWithTransition(TabItem1, TTabTransition.Slide);
  Form1.ClearInputFields(Self);
end;

procedure TForm3.SpeedButton2Click(Sender: TObject);
begin
  TStudent.DeleteStudent(DataModule4.FDTable1, TabControl1, TabItem1);
end;

procedure TForm3.TabControl1Changing(Sender: TObject;
  var AAllowChange: Boolean);
begin
  // ShowMessage('Changing');
end;

procedure TForm3.TabItem1Click(Sender: TObject);
begin
  // ShowMessage('TabItem2Click');
  var
    screen_width: Single; // ,screen_height
  screen_width := GetScreenWidthPixels;
  // screen_height:=GetScreenHeightInPixels;
  Circle1.Position.X := (screen_width / 2) - Circle1.Width;
  // Circle1.Position.Y:=screen_height/2;
  Circle1.Position.Y := 0;
  AnimateCircle;
  // Form1.activeTable(DataModule4.FDTable1);
end;

procedure TForm3.TabItem2Click(Sender: TObject);
begin
  // ShowMessage('TabItem2Click');
  AnimateLayouts;
  // Form1.activeTable(DataModule4.FDTable2);
end;

procedure TForm3.TabItem3Click(Sender: TObject);
begin
  // AnimateTextDropFromText;
  AnimateTextDropFromRightToLeft;
  Form1.activeTable(DataModule4.FDQuery1);
end;

procedure TForm3.Timer1Timer(Sender: TObject);
begin
  FloatAnimation1.Start;
end;

end.
