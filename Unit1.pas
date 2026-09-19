unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls,JavaAPI,PythonAPI, App,
  FMX.Ani, FMX.TabControl, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FMX.Edit, FMX.ListBox,RegularExpressions,
  FMX.DateTimeCtrls, FMX.Effects, System.ImageList, FMX.ImgList;

type
  TForm1 = class(TForm)
    VertScrollBox1: TVertScrollBox;
    Layout1: TLayout;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Label1: TLabel;
    Label2: TLabel;
    GridLayout1: TGridLayout;
    Rectangle1: TRectangle;
    Image1: TImage;
    Label3: TLabel;
    Rectangle2: TRectangle;
    Image2: TImage;
    Label4: TLabel;
    Rectangle3: TRectangle;
    Image3: TImage;
    Label5: TLabel;
    Rectangle6: TRectangle;
    Image4: TImage;
    Label6: TLabel;
    Rectangle7: TRectangle;
    Image5: TImage;
    Label7: TLabel;
    Rectangle8: TRectangle;
    Image6: TImage;
    Label8: TLabel;
    Rectangle9: TRectangle;
    Image7: TImage;
    Label9: TLabel;
    ImageList1: TImageList;
    layoutSecondair: TLayout;
    layoutPrincipal: TLayout;
    Layout2: TLayout;
    Rectangle10: TRectangle;
    Layout3: TLayout;
    Rectangle11: TRectangle;
    Layout4: TLayout;
    Rectangle12: TRectangle;
    Image8: TImage;
    Rectangle13: TRectangle;
    Label10: TLabel;
    GridLayout2: TGridLayout;
    Rectangle14: TRectangle;
    RoundRect1: TRoundRect;
    Label11: TLabel;
    Image9: TImage;
    Rectangle15: TRectangle;
    RoundRect2: TRoundRect;
    Image10: TImage;
    Label12: TLabel;
    Rectangle16: TRectangle;
    RoundRect3: TRoundRect;
    Image11: TImage;
    Label13: TLabel;
    Rectangle17: TRectangle;
    RoundRect4: TRoundRect;
    Image12: TImage;
    Label14: TLabel;
    Rectangle18: TRectangle;
    RoundRect5: TRoundRect;
    Image13: TImage;
    Label15: TLabel;
    Rectangle19: TRectangle;
    RoundRect6: TRoundRect;
    Image14: TImage;
    Label16: TLabel;
    Label17: TLabel;
    Rectangle20: TRectangle;
    RoundRect7: TRoundRect;
    Image15: TImage;
    Label18: TLabel;
    Rectangle21: TRectangle;
    RoundRect8: TRoundRect;
    Image16: TImage;
    Label19: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Rectangle1Click(Sender: TObject);
    procedure Rectangle9Click(Sender: TObject);
    procedure Rectangle3Click(Sender: TObject);
    procedure Rectangle2Click(Sender: TObject);
    procedure Rectangle8Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: WideChar;
      Shift: TShiftState);
    procedure Rectangle6Click(Sender: TObject);
    procedure Rectangle17Click(Sender: TObject);
    procedure Rectangle16Click(Sender: TObject);
    procedure Rectangle15Click(Sender: TObject);
    procedure Rectangle14Click(Sender: TObject);
    procedure Rectangle18Click(Sender: TObject);
    procedure Rectangle19Click(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Rectangle20Click(Sender: TObject);
    procedure Rectangle21Click(Sender: TObject);
  private
    { Déclarations privées }
    screen_width:Single;
  public
    { Déclarations publiques }
    procedure activeForm(form:TForm);
    procedure showForm(form:TForm);
    procedure AnimateRectangle(ARect: TRectangle; ADelay: Single);
    procedure back(AForm: TForm; var Key: Word);
    procedure check_them;
    procedure started;
    procedure activeTable(tableName:TFDTable);overload;
    procedure activeTable(tableName:TFDQuery);overload;
    procedure ClearInputFields(AOwner: TComponent);
    procedure AnimateCircle(anim:TFloatAnimation;timer:TTimer;Circle:TCircle);
    procedure Timer1Timer(Sender: TObject);
    function email_is_match(Aedit:TEdit;ShadowEffect:TShadowEffect):Boolean;
    function ActiveLayout: Boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  Unit2, Unit3, Unit4, Unit5, Unit6,
{$ifdef android}
  FMX.VirtualKeyboard,FMX.VirtualKeyboard.Android,
  Permissions,
  Androidapi.Helpers,
  Androidapi.JNI.Os,
{$endif}
  FMX.Platform,
  ioutils,
  FMX.DialogService, Unit7, Unit8, Unit9, Unit10;

//uses
//  Androidapi.Helpers,
//  Androidapi.JNI.App,
//  Androidapi.JNI.GraphicsContentViewText,
//  Androidapi.JNI.JavaTypes,
//  Androidapi.JNI.OS,
//  FMX.Helpers.Android;



//FMX.Platform;
//LocaleService: IFMXLocaleService;
// OSLang := '';
//  if TPlatformServices.Current.SupportsPlatformService(IFMXLocaleService, IInterface(LocaleService)) then
//  begin
//    OSLang := LocaleService.GetCurrentLangID();
//
//    // if set Japanese on Android, LocaleService returns "jp", but other platform returns "ja"
//    // so I think it is better to change "jp" to "ja"
//    if (OSLang = 'jp') then OSLang := 'ja';

procedure TForm1.activeForm(form: TForm);
begin
  form.Show;
  Self.Hide;
end;

procedure TForm1.activeTable(tableName: TFDTable);
begin
  if not tableName.Active then
  begin
    tableName.Active:=True;
  end
  else
  begin
    tableName.Active:=False;
  end;
end;

function TForm1.ActiveLayout: Boolean;
begin
  if Form1.layoutPrincipal.Visible then
  begin
    Form1.layoutSecondair.Visible:=True;
    Form1.layoutPrincipal.Visible:=False;
    Result:=True;
  end
  else
  begin
    Form1.layoutSecondair.Visible:=False;
    Form1.layoutPrincipal.Visible:=True;
    Result:=False;
  end;
  // إذا كان المطلوب هو إظهار الـ Layout الأساسي
  //if SameText(LayoutName, 'layoutPrincipal') then
//  if LayoutName.Visible then
//  begin
//    layoutPrincipal.Visible := True;
//    layoutSecondair.Visible := False;
//    Result := True;
//  end
//  // إذا كان المطلوب هو إظهار الـ Layout الثانوي
//  else
//  if SameText(LayoutName, 'layoutSecondair') then
//  begin
//    layoutPrincipal.Visible := False;
//    layoutSecondair.Visible := True;
//    Result := False;
//  end
//  else
//  begin
//    // في حالة إدخال اسم غير صحيح
//    Result := False;
//  end;
end;

procedure TForm1.activeTable(tableName: TFDQuery);
begin
  tableName.Active:=True;
end;

procedure TForm1.AnimateCircle(anim:TFloatAnimation;timer:TTimer;Circle:TCircle);
begin
  // إعداد الـ Animation
  anim := TFloatAnimation.Create(Circle);
  anim.Parent := Circle;
  anim.PropertyName := 'Position.Y';
  anim.StartValue := Circle.Position.Y;
  anim.StopValue := Circle.Position.Y + 20;
  anim.Duration := 0.3;
  anim.AutoReverse := True;
  anim.Loop := False;
  anim.Enabled := False;

  timer := TTimer.Create(Self);
  timer.Interval := 5000; // كل 5 ثوانٍ
  timer.OnTimer := Timer1Timer;
  timer.Enabled := True;
end;

procedure TForm1.AnimateRectangle(ARect: TRectangle; ADelay: Single);
var
  OpacityAnim: TFloatAnimation;
  //MoveAnim: TFloatAnimation;
begin
  ARect.Opacity := 0;
  ARect.Position.Y := ARect.Position.Y + 20;

  OpacityAnim := TFloatAnimation.Create(ARect);
  OpacityAnim.Parent := ARect;
  OpacityAnim.PropertyName := 'Opacity';
  OpacityAnim.StartValue := 0;
  OpacityAnim.StopValue := 1;
  OpacityAnim.Duration := 0.4;
  OpacityAnim.Delay := ADelay;
  OpacityAnim.AutoReverse := False;
  OpacityAnim.Loop := False;
  OpacityAnim.Enabled := True;

//  MoveAnim := TFloatAnimation.Create(ARect);
//  MoveAnim.Parent := ARect;
//  MoveAnim.PropertyName := 'Position.Y';
//  MoveAnim.StartValue := ARect.Position.Y;
//  MoveAnim.StopValue := ARect.Position.Y - 20;
//  MoveAnim.Duration := 0.4;
//  MoveAnim.Delay := ADelay;
//  MoveAnim.AutoReverse := False;
//  MoveAnim.Loop := False;
//  MoveAnim.Enabled := True;
end;

procedure TForm1.back(AForm: TForm; var Key: Word);
//begin
//  if Key = vkHardwareBack then
//  begin
//    // عرض الفورم الرئيسي
//    Form1.Show;
//
//    // إغلاق الفورم الحالي
//    AForm.Close;
//
//    // منع المعالجة الافتراضية للزر
//    Key := 0;
//  end;
//end;
//begin
//  if Key = vkHardwareBack then
//  begin
//    if AForm = Form1 then
//    begin
//      // عرض رسالة تنبيه فقط على Form1
//      ShowMessage('أنت في الصفحة الرئيسية!');
//      Key := 0;
//    end
//    else
//    begin
//      // الرجوع إلى الصفحة الرئيسية
//      Form1.Show;
//      AForm.Close;
//    end;
//    Key := 0; // منع النظام من تنفيذ أي شيء آخر
//  end;
//end;

//begin
//  if Key = vkHardwareBack then
//  begin
//    // التحقق من وجود TabControl1 في الفورم الحالي
//    if AForm.FindComponent('TabControl1') is TTabControl then
//    begin
//      var TabControl := TTabControl(AForm.FindComponent('TabControl1'));
//
//      // إذا كانت الصفحة الحالية هي TabItem1
//      if TabControl.ActiveTab = TabControl.Tabs[0] then
//      begin
//        if AForm = Form1 then
//        begin
//          ShowMessage('أنت في الصفحة الرئيسية!');
//        end
//        else
//        begin
//          Form1.Show;
//          AForm.Close;
//        end;
//      end
//      else
//      begin
//        // الرجوع إلى الصفحة الرئيسية داخل TabControl
//        TabControl.ActiveTab := TabControl.Tabs[0];
//      end;
//    end
//    else
//    begin
//      // إذا لم يكن هناك TabControl، يتم الرجوع إلى Form1
//      if AForm <> Form1 then
//      begin
//        Form1.Show;
//        AForm.Close;
//      end;
//    end;
//
//    Key := 0; // منع النظام من تنفيذ الإجراء الافتراضي للزر
//  end;
//end;


{$ifdef android}
var

  FService: IFMXVirtualKeyboardService;
  KeyboardVisible: Boolean;
{$endif}
begin
{$ifdef android}
  if Key = vkHardwareBack then
  begin
    // التحقق من وجود لوحة المفاتيح الافتراضية وإخفائها إذا كانت ظاهرة
    if TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService, IInterface(FService)) then
    begin
      KeyboardVisible := TVirtualKeyboardState.Visible in FService.VirtualKeyBoardState;
      if KeyboardVisible then
      begin
        FService.HideVirtualKeyboard;
        Key := 0; // منع إغلاق الفورم، فقط إخفاء لوحة المفاتيح
        Exit;
      end;
    end;

    // التحقق من وجود TabControl1 في الفورم الحالي
    if AForm.FindComponent('TabControl1') is TTabControl then
    begin
      var TabControl := TTabControl(AForm.FindComponent('TabControl1'));

      // إذا كانت الصفحة الحالية هي TabItem1
      if TabControl.ActiveTab = TabControl.Tabs[0] then
      begin
        if AForm = Form1 then
        begin
          ShowMessage('أنت في الصفحة الرئيسية!');
        end
        else
        begin
          Form1.Show;
          AForm.Close;
        end;
      end
      else
      begin
        // الرجوع إلى الصفحة الرئيسية داخل TabControl
        TabControl.ActiveTab := TabControl.Tabs[0];
      end;
    end
    else
    begin
      // إذا لم يكن هناك TabControl، يتم الرجوع إلى Form1
      if AForm <> Form1 then
      begin
        Form1.Show;
        AForm.Close;
      end;
    end;

    Key := 0; // منع النظام من تنفيذ الإجراء الافتراضي للزر
  end;
{$endif}
end;

procedure TForm1.check_them;
var
  stringLists: TStringList;
  ThemeValue: string;
begin
  stringLists := TStringList.Create;
  try
    stringLists.LoadFromFile(TPath.GetDocumentsPath + PathDelim + 'setting.txt');

    if stringLists.Count > 0 then
    begin
      ThemeValue := stringLists.Strings[0];

      if ThemeValue = '0' then
      begin
        Form2.Switch1.IsChecked := False;
        Self.StyleBook := Form2.StyleBook2;  // Light Theme
        Form2.number_tag := 0;
      end
      else if ThemeValue = '1' then
      begin
        Form2.Switch1.IsChecked := True;
        Self.StyleBook := Form2.StyleBook1;  // Dark Theme
        Form2.number_tag := 1;
      end
      else if ThemeValue = '2' then
      begin
        Form2.Switch1.IsChecked := True;
        Self.StyleBook := Form2.StyleBook3;  // Dark2 Theme
        Form2.number_tag := 2;
      end;
    end;
  except
    // في حالة حدوث خطأ (مثل عدم وجود الملف)
    Form2.Switch1.IsChecked := False;
    Form2.number_tag := 0;
    // يمكنك عرض رسالة هنا إن أردت
    // ShowMessage('تعذر تحميل إعدادات الثيم.');
  end;
  stringLists.Free;
end;

procedure TForm1.ClearInputFields(AOwner: TComponent);
var
  I: Integer;
begin
  for I := 0 to AOwner.ComponentCount - 1 do
  begin
    if AOwner.Components[I] is TEdit then
      TEdit(AOwner.Components[I]).Text := ''

    else if AOwner.Components[I] is TComboBox then
      TComboBox(AOwner.Components[I]).ItemIndex := -1

    else if AOwner.Components[I] is TDateEdit then
      TDateEdit(AOwner.Components[I]).Date := now; // أو تعيين التاريخ لقيمة افتراضية

    // يمكنك إضافة مكونات أخرى حسب الحاجة
  end;
end;

function TForm1.email_is_match(Aedit:TEdit;ShadowEffect:TShadowEffect):Boolean;
const
  mail_scan='^((?>[a-zA-Z\d!#$%&''*+\-/=?^_`{|}~]+\x20*' +
          '|"((?=[\x01-\x7f])[^"\\]|\\[\x01-\x7f])*"\' +
          'x20*)*(?<angle><))?((?!\.)(?>\.?[a-zA-Z\d!' +
          '#$%&''*+\-/=?^_`{|}~]+)+|"((?=[\x01-\x7f])' +
          '[^"\\]|\\[\x01-\x7f])*")@(((?!-)[a-zA-Z\d\' +
          '-]+(?<!-)\.)+[a-zA-Z]{2,}|\[(((?(?<!\[)\.)' +
          '(25[0-5]|2[0-4]\d|[01]?\d?\d)){4}|[a-zA-Z\' +
          'd\-]*[a-zA-Z\d]:((?=[\x01-\x7f])[^\\\[\]]|' +
          '\\[\x01-\x7f])+)\])(?(angle)>)$';


begin
  Result:=false;
  if TRegEx.IsMatch(Aedit.Text, mail_scan) then
  begin
		ShadowEffect.ShadowColor := TAlphaColors.Green;
    Result:=True;
  end
	else
  begin
		ShadowEffect.ShadowColor := TAlphaColors.Red;
    Result:=false;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  var color := Integer(TAlphaColorRec.Teal); // أو أي لون
  SetStatusAndNavBarColor(color); // لونك المفضل
  screen_width:=GetScreenWidthPixels;
  GridLayout1.ItemWidth:=(screen_width /3);
  GridLayout1.ItemHeight:=(screen_width /3);
  Label10.Text:=GetFormattedDate;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: WideChar; Shift: TShiftState);
{$IFDEF ANDROID}
var
  FService:IFMXVirtualKeyboardService;
{$ENDIF}
begin
{$IFDEF ANDROID}
  if Key=vkHardwareBack then
  begin
    TPlatformServices.Current.SupportsPlatformService(IFMXVirtualKeyboardService,
                  iinterface(FService));
    if (FService<>nil) then
    begin
      Key:=0;
       TDialogService.MessageDialog('هل تريد الخروج من التطبيق', System.UITypes.TMsgDlgType.mtInformation,
        [System.UITypes.TMsgDlgBtn.mbOK, System.UITypes.TMsgDlgBtn.mbCancel],
        System.UITypes.TMsgDlgBtn.mbOK, 0,
        procedure(const AResult: TModalResult)
        begin
          case AResult of
            mrOk:begin
                  application.MainForm.Close;

                  end;
            mrCancel:

          end;
        end);
    end
    else
    begin

    end;
  end;
{$ENDIF}
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  started;
  AnimateRectangle(Rectangle1, 0);
  AnimateRectangle(Rectangle2, 0.2);
  AnimateRectangle(Rectangle3, 0.4);
  AnimateRectangle(Rectangle6, 0.6);
  AnimateRectangle(Rectangle7, 0.8);
  AnimateRectangle(Rectangle8, 1);
  AnimateRectangle(Rectangle9, 1.2);
{$ifdef android}
  check_them;
{$endif}
end;

procedure TForm1.Label10Click(Sender: TObject);
begin
  ShowMessage('walid is here'+GetFormattedDate);
  var color := Integer(TAlphaColorRec.Teal); // أو أي لون
  SetStatusAndNavBarColor(color); // لونك المفضل
  screen_width:=GetScreenWidthPixels;
  GridLayout1.ItemWidth:=(screen_width /3);
  GridLayout1.ItemHeight:=(screen_width /3);
  Label2.Text:=GetFormattedDate;
end;


procedure TForm1.Rectangle14Click(Sender: TObject);
begin
  activeForm(Form7);
end;

procedure TForm1.Rectangle15Click(Sender: TObject);
begin
  activeForm(Form5);
end;

procedure TForm1.Rectangle16Click(Sender: TObject);
begin
  activeForm(Form10);
end;

procedure TForm1.Rectangle17Click(Sender: TObject);
begin
  activeForm(Form3);
end;

procedure TForm1.Rectangle18Click(Sender: TObject);
begin
  activeForm(Form9);
end;

procedure TForm1.Rectangle19Click(Sender: TObject);
begin
  activeForm(Form6);
end;

procedure TForm1.Rectangle1Click(Sender: TObject);
var
  TableList: TStringList;
  SourceDBPath, TargetDBPath: string;
begin
//  ShowMessage('click');
//  //GetHijriDateFromAPI;
////  var
////  FormattedDate: string;
////  FormattedDate := GetFormattedHijriDateFromAPI(DateToStr(now));
////  ShowMessage(FormattedDate);
// SourceDBPath := TPath.Combine(TPath.GetDocumentsPath, 'assets' + PathDelim + 'internal' + PathDelim + 'School.db');
//  TargetDBPath := TPath.Combine(TPath.GetDocumentsPath, 'School.db');
//
//  // إذا لم تكن نسخة موجودة بالفعل في GetDocumentsPath، انسخها
//  if not FileExists(TargetDBPath) then
//    TFile.Copy(SourceDBPath, TargetDBPath);
//
//  DataModule4.FDConnection1.Params.Values['Database'] := TargetDBPath;
//  DataModule4.FDConnection1.Connected := True;
//
//ShowMessage('Database path: ' + TPath.GetDocumentsPath + PathDelim + 'School.db');
//  TableList := TStringList.Create;
//  try
//    DataModule4.FDConnection1.GetTableNames('', '', '', TableList);
//    ShowMessage('Tables: ' + TableList.Text);
//  finally
//    TableList.Free;
//  end;

  activeForm(Form7);
end;

procedure TForm1.Rectangle20Click(Sender: TObject);
begin
  activeForm(Form8);
end;

procedure TForm1.Rectangle21Click(Sender: TObject);
begin
  activeForm(Form2);
end;

procedure TForm1.Rectangle2Click(Sender: TObject);
begin
  activeForm(Form5);
end;

procedure TForm1.Rectangle3Click(Sender: TObject);
begin
  activeForm(Form3);
end;

procedure TForm1.Rectangle6Click(Sender: TObject);
begin
  activeForm(Form8);
end;

procedure TForm1.Rectangle8Click(Sender: TObject);
begin
  activeForm(Form6);
end;

procedure TForm1.Rectangle9Click(Sender: TObject);
begin
  activeForm(Form2);
end;

procedure TForm1.showForm(form: TForm);
begin
  form.Show;
  Self.Close;
end;

procedure TForm1.started;
begin
{$IFDEF ANDROID}
  DataModule4.FDConnection1.Params.Values['Database'] := TPath.GetDocumentsPath + PathDelim + 'School.db';
  DataModule4.FDConnection1.Connected:=True;
  DataModule4.FDTable1.Active:=True;
  DataModule4.FDTable2.Active:=True;
  DataModule4.FDTable3.Active:=True;
  DataModule4.FDTable4.Active:=True;
  var FPermissionReadExternalStorage := JStringToString(TJManifest_permission.JavaClass.READ_EXTERNAL_STORAGE);
  var FPermissionWriteExternalStorage := JStringToString(TJManifest_permission.JavaClass.WRITE_EXTERNAL_STORAGE);
  PermissionsService.RequestPermissions([FPermissionReadExternalStorage, FPermissionWriteExternalStorage], nil, nil);
{$ELSE}
  DataModule4.FDConnection1.Params.Values['Database'] := TPath.Combine(ExpandFileName(GetCurrentDir),'..\..\School.db');
  DataModule4.FDConnection1.Connected:=True;
  DataModule4.FDTable1.Active:=True;
  DataModule4.FDTable2.Active:=True;
  DataModule4.FDTable3.Active:=True;
  DataModule4.FDTable4.Active:=True;
{$ENDIF}
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  //FloatAnimation1.Start;
end;

end.
