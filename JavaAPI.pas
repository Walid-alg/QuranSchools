unit JavaAPI;

interface

uses
  System.SysUtils, FMX.Dialogs,FMX.Platform,
{$ifdef android}
  Androidapi.JNI.OS,
  Androidapi.JNI.JavaTypes,
  FMX.Helpers.Android,
  Androidapi.Helpers,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Util,
  Androidapi.JNIBridge,
  Androidapi.JNI.App,
{$endif}
  FMX.Types;
{$IFDEF ANDROID}
type
// ===== Forward declarations =====
  JToast = interface;//android.widget.Toast

// ===== Interface declarations =====
  JToastClass = interface(JObjectClass)
    ['{D06A7EAF-EE60-4F55-A3EA-E7B0B37EC7CB}']
    {class} function _GetLENGTH_LONG: Integer; cdecl;
    {class} function _GetLENGTH_SHORT: Integer; cdecl;
    {class} function init(context: JContext): JToast; cdecl;
    {class} function makeText(context: JContext; text: JCharSequence; duration: Integer): JToast; cdecl; overload;
    {class} function makeText(context: JContext; resId: Integer; duration: Integer): JToast; cdecl; overload;
    {class} property LENGTH_LONG: Integer read _GetLENGTH_LONG;
    {class} property LENGTH_SHORT: Integer read _GetLENGTH_SHORT;
  end;

  [JavaSignature('android/widget/Toast')]
  JToast = interface(JObject)
    ['{410DDA5F-7D4B-415E-8BE4-F545D331176C}']
    procedure cancel; cdecl;
    function getDuration: Integer; cdecl;
    function getGravity: Integer; cdecl;
    function getHorizontalMargin: Single; cdecl;
    function getVerticalMargin: Single; cdecl;
    function getView: JView; cdecl;
    function getXOffset: Integer; cdecl;
    function getYOffset: Integer; cdecl;
    procedure setDuration(duration: Integer); cdecl;
    procedure setGravity(gravity: Integer; xOffset: Integer; yOffset: Integer); cdecl;
    procedure setMargin(horizontalMargin: Single; verticalMargin: Single); cdecl;
    procedure setText(resId: Integer); cdecl; overload;
    procedure setText(s: JCharSequence); cdecl; overload;
    procedure setView(view: JView); cdecl;
    procedure show; cdecl;
  end;
  TJToast = class(TJavaGenericImport<JToastClass, JToast>) end;
 {$ENDIF}

  procedure SetStatusAndNavBarColor(const AColor: Integer);
  function GetScreenWidthPixels: Single;
  function GetScreenHeightInPixels: Single;
  function GetScreenWidthsInPixels: Integer;
  function GetFormattedDate: string;
  procedure Toast(const Msg: string);

implementation

uses
  //Androidapi.JNI.Calendar,
  System.DateUtils,
  App;


//procedure EnableImmersiveMode;
//var
//  View: JView;
//  UIOptions: Integer;
//begin
//  if TJBuild_VERSION.JavaClass.SDK_INT >= 19 then // Android 4.4+
//  begin
//    View := TAndroidHelper.Activity.getWindow.getDecorView;
//
//    // تفعيل وضع ملء الشاشة مع إخفاء الشرائط
//    UIOptions :=
//      TJView.JavaClass.SYSTEM_UI_FLAG_HIDE_NAVIGATION or
//      TJView.JavaClass.SYSTEM_UI_FLAG_FULLSCREEN or
//      TJView.JavaClass.SYSTEM_UI_FLAG_IMMERSIVE_STICKY;
//
//    View.setSystemUiVisibility(UIOptions);
//  end;
//end;
//procedure SetSystemBarsColored(AColor: Integer);
//var
//  Window: JWindow;
//begin
//  if TJBuild_VERSION.JavaClass.SDK_INT >= 21 then
//  begin
//    Window := TAndroidHelper.Activity.getWindow;
//
//    // تعيين اللون لشريط الحالة (Status Bar)
//    Window.setStatusBarColor(AColor);
//
//    // تعيين اللون لشريط التنقل (Navigation Bar)
//    Window.setNavigationBarColor(AColor);
//  end;
//end;

//procedure EnableImmersiveModeWithColor(AColor: Integer);
//var
//  View: JView;
//  UIOptions: Integer;
//begin
//  if TJBuild_VERSION.JavaClass.SDK_INT >= 21 then
//  begin
//    // تعيين اللون أولاً
//    SetSystemBarsColored(AColor);
//
//    // ثم تفعيل وضع أقل تدخلًا (لا يخفي الشرائط بالكامل بل يمنع ظهور الرموز فوق المحتوى)
//    View := TAndroidHelper.Activity.getWindow.getDecorView;
//
//    UIOptions :=
//      TJView.JavaClass.SYSTEM_UI_FLAG_LAYOUT_STABLE or
//      TJView.JavaClass.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN or
//      TJView.JavaClass.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION;
//
//    View.setSystemUiVisibility(UIOptions);
//  end;
//end;

//EnableImmersiveModeWithColor($FF31A293); // لون أخضر مزرق للشريطين

//procedure SetStatusAndNavBarColor(AColor: Integer);
//var
//  Window: JWindow;
//  SDKInt: Integer;
//begin
//  SDKInt := TJBuild_VERSION.JavaClass.SDK_INT;
//
//  if SDKInt >= 21 then // تأكد أن النظام يدعم
//  begin
//    try
//      Window := TAndroidHelper.Activity.getWindow;
//
//      // التأكد من وجود الدوال
//      if Assigned(Window) then
//      begin
//        Window.setStatusBarColor(AColor);
//        Window.setNavigationBarColor(AColor);
//      end;
//    except
//      on E: Exception do
//        ShowMessage('حدث خطأ عند محاولة تغيير لون الشريط: ' + E.Message);
//    end;
//  end
//  else
//    ShowMessage('جهازك لا يدعم تلوين الشريط (يتطلب Android 5.0 فما فوق)');
//end;

procedure SetStatusAndNavBarColor(const AColor: Integer);
{$ifdef android}
var
  Window: JWindow;
{$endif}
begin
{$ifdef android}
//  if TJBuild_VERSION.JavaClass.SDK_INT >= 21 then
//  begin
    Window := TAndroidHelper.Activity.getWindow;
    // لا تستخدم try..except لأن verifier يرفض دوال غير معرّفة
    if Assigned(Window) then
    begin
//      ShowMessage('walid');
      // استدعِ التلوين فقط إذا API >= 21 (Android 5.0+)
      Window.setStatusBarColor(AColor);
      Window.setNavigationBarColor(AColor);
    end;
//  end;
{$endif}
end;

function GetScreenWidthPixels: Single;
var
  ScreenService: IFMXScreenService;
begin
  Result := 0;
  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, IInterface(ScreenService)) then
    Result := ScreenService.GetScreenSize.X;
end;

function GetScreenHeightInPixels: Single;
var
  ScreenService: IFMXScreenService;
begin
  Result := 0;
  if TPlatformServices.Current.SupportsPlatformService(IFMXScreenService, IInterface(ScreenService)) then
    Result := ScreenService.GetScreenSize.Y;//Round(ScreenService.GetScreenSize.Y);
end;

function GetScreenWidthsInPixels: Integer;
{$ifdef android}
var
  Metrics: JDisplayMetrics;
{$endif}
begin
{$ifdef android}
  Metrics := TJDisplayMetrics.Create;
  TAndroidHelper.Activity.getWindowManager.getDefaultDisplay.getMetrics(Metrics);
  Result := Metrics.widthPixels;
{$endif}
end;

function GetFormattedDate: string;
//var
//  Calendar: JCalendar;
//  DayOfWeek, DayOfMonth, MonthOfYear, Year: Integer;
//  HijriDate: THijriDate;
//  MonthName, DayName: string;
//begin
//  // احصل على التاريخ الميلادي الحالي
//  Calendar := TJCalendar.Create;
//  Calendar.setTimeInMillis(Calendar.getTimeInMillis); // احصل على الوقت الحالي
//
////  // استرجاع اليوم من الأسبوع، اليوم من الشهر، الشهر والسنة
//  DayOfWeek := Calendar.get(JCalendar.FIELD_DAY_OF_WEEK);
//  DayOfMonth := Calendar.get(JCalendar.FIELD_DAY_OF_MONTH);
//  MonthOfYear := Calendar.get(JCalendar.FIELD_MONTH);
//  Year := Calendar.get(JCalendar.FIELD_YEAR);
////
////  // تحويل اليوم من الأسبوع إلى اسم اليوم بالعربية
////  case DayOfWeek of
////    1: DayName := 'الأحد';
////    2: DayName := 'الاثنين';
////    3: DayName := 'الثلاثاء';
////    4: DayName := 'الأربعاء';
////    5: DayName := 'الخميس';
////    6: DayName := 'الجمعة';
////    7: DayName := 'السبت';
////  end;
////
////  // تحويل الشهر الميلادي إلى اسمه بالعربية
////  case MonthOfYear of
////    0: MonthName := 'جانفي';
////    1: MonthName := 'فبراير';
////    2: MonthName := 'مارس';
////    3: MonthName := 'أفريل';
////    4: MonthName := 'ماي';
////    5: MonthName := 'جوان';
////    6: MonthName := 'جويلية';
////    7: MonthName := 'أوت';
////    8: MonthName := 'سبتمبر';
////    9: MonthName := 'أكتوبر';
////    10: MonthName := 'نوفمبر';
////    11: MonthName := 'ديسمبر';
////  end;
////
////  // تحويل التاريخ الميلادي إلى هجري
////  HijriDate := Gre2Hijri(DayOfMonth, MonthOfYear + 1, Year); // الشهر الميلادي يبدأ من 0، لذلك نضيف 1
////  Result := Format('%s %.2d %s %d/ %.2d %s %d', [DayName, HijriDate.HijriDate, HijriMonths(HijriDate.HijriMonth), HijriDate.HijriYear, DayOfMonth, MonthName, Year]);
//end;
{$ifdef android}
var
  Calendar: JCalendar;
  DayOfWeek, DayOfMonth, MonthOfYear, Year: Integer;
  HijriDate: THijriDate;
  MonthName, DayName: string;
  Day, Month, Years: Word;
{$endif}
begin
{$ifdef android}
  // احصل على التاريخ الميلادي الحالي
//  Calendar := TJCalendar.Create;
  Calendar := TJCalendar.JavaClass.getInstance;
  Calendar.setTimeInMillis(Calendar.getTimeInMillis); // احصل على الوقت الحالي

  // استرجاع اليوم من الأسبوع، اليوم من الشهر، الشهر والسنة
  DayOfWeek := Calendar.get(7);  // الحقل 7 هو اليوم من الأسبوع (1-7)
  DayOfMonth := Calendar.get(5); // الحقل 5 هو اليوم من الشهر
  MonthOfYear := Calendar.get(2); // الحقل 2 هو الشهر (0-11)
  Year := Calendar.get(1); // الحقل 1 هو السنة

  // تحويل اليوم من الأسبوع إلى اسم اليوم بالعربية
  case DayOfWeek of
    1: DayName := 'الأحد';
    2: DayName := 'الاثنين';
    3: DayName := 'الثلاثاء';
    4: DayName := 'الأربعاء';
    5: DayName := 'الخميس';
    6: DayName := 'الجمعة';
    7: DayName := 'السبت';
  else
    DayName := 'غير معروف';
  end;

  // تحويل الشهر الميلادي إلى اسمه بالعربية
  case MonthOfYear of
    0: MonthName := 'جانفي';
    1: MonthName := 'فيفري';
    2: MonthName := 'مارس';
    3: MonthName := 'أفريل';
    4: MonthName := 'ماي';
    5: MonthName := 'جوان';
    6: MonthName := 'جويلية';
    7: MonthName := 'أوت';
    8: MonthName := 'سبتمبر';
    9: MonthName := 'أكتوبر';
    10: MonthName := 'نوفمبر';
    11: MonthName := 'ديسمبر';
  else
    MonthName := 'غير معروف';
  end;

  Day := DayOfMonth;
  Month := MonthOfYear + 1;  // الشهر الميلادي يبدأ من 0، لذلك نضيف 1
  Years := Year;
  // تحويل التاريخ الميلادي إلى هجري
  HijriDate := Gre2Hijri(Day, Month, Years);//(DayOfMonth, MonthOfYear + 1, Year); // الشهر الميلادي يبدأ من 0، لذلك نضيف 1
  Result := Format('%s %.2d %s %d/ %.2d %s %d', [DayName, HijriDate.HijriDate, HijriMonths(HijriDate.HijriMonth), HijriDate.HijriYear, DayOfMonth, MonthName, Year]);
{$endif}
end;

procedure Toast(const Msg: string);
type
  TToastLength = (LongToast, ShortToast);
var
  ToastLength: Integer;
begin
{$IFDEF ANDROID}
// if duration = ShortToast then
      ToastLength := TJToast.JavaClass.LENGTH_SHORT;
//    else
//      ToastLength := TJToast.JavaClass.LENGTH_LONG;

    CallInUiThread (
      procedure
      begin
        TJToast.JavaClass.makeText (TAndroidHelper.Context,StrToJCharSequence(Msg), ToastLength).show;
      end
    );
{$ENDIF}
end;

end.
