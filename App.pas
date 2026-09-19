unit App;

interface

uses
  System.SysUtils, System.Math,System.Net.URLClient, System.Net.HttpClient,FireDAC.Comp.Client,
  System.Net.HttpClientComponent,System.JSON,System.Generics.Collections,FMX.TabControl,
  DateUtils,FMX.ListBox,FMX.Forms, FMX.Dialogs,FMX.DialogService,System.UITypes;

//type
//  TGender = (Male, Female);
//  TLevel = (Preparatory, Kids, Adults);
//  TRelation = (Father, Mother, Uncle);
//  TSessionType = (Hifdh, Review, Tajweed);
//  TPresenceStatus = (Present, Absent);

//type
//  // نوع الجنس
//  TGender = (Male, Female);
//
//  // نوع العلاقة
//  TRelation = (Father, Mother, Uncle);
//
//  // نوع الحصة
//  TSessionType = (Preparatory, Kids, Adults);
//
//  // نوع التقييم
//  TEvaluationType = (Memorization, Revision, Tajweed);
//
//  // الحالة: حضور أو غياب
//  TAttendanceState = (Present, Absent);

//  // ✅ كلاس التخصص
//  TSpecialty = class
//  public
//    ID: Integer;
//    Name: string;
//  end;
//
//  // ✅ كلاس المعلم - يرتبط بـ Specialty
//  TTeacher = class
//  public
//    ID: Integer;
//    FirstName: string;
//    LastName: string;
//    Address: string;
//    Phone: string;
//    Specialty: TSpecialty; // Association
//  end;
//
//  // ✅ كلاس ولي الأمر - يمكنه امتلاك أكثر من طالب
//  TGuardian = class
//  public
//    ID: Integer;
//    FirstName: string;
//    LastName: string;
//    Relation: TRelation;
//    Address: string;
//    Phone: string;
//    Email: string;
//    Children: TObjectList<TObject>; // سيتم الربط لاحقاً
//  end;
//
//  // ✅ كلاس الطالب - يرتبط بولي الأمر والمعلم
//  TStudent = class
//  public
//    ID: Integer;
//    FirstName: string;
//    LastName: string;
//    BirthDate: TDate;
//    Age: Integer;
//    Address: string;
//    Gender: TGender;
//    Phone: string;
//    EnrollmentDate: TDate;
//    Level: TSessionType;
//    Guardian: TGuardian;
//    Teacher: TTeacher;
//  end;
//
//  // ✅ كلاس الحصة - يرتبط بمعلم وتخصص
//  TSession = class
//  public
//    ID: Integer;
//    Name: string;
//    Teacher: TTeacher;
//    Specialty: TSpecialty;
//    Level: TSessionType;
//    DayOfWeek: string;
//    FromTime: TTime;
//    ToTime: TTime;
//  end;
//
//  // ✅ كلاس الحضور والغياب
//  TAttendance = class
//  public
//    ID: Integer;
//    Student: TStudent;
//    Session: TSession;
//    Date: TDate;
//    Status: TAttendanceState;
//  end;
//
//  // ✅ كلاس التقييم
//  TEvaluation = class
//  public
//    ID: Integer;
//    Student: TStudent;
//    Surah: string;
//    FromAyah: Integer;
//    ToAyah: Integer;
//    Date: TDate;
//    Teacher: TTeacher;
//    EvalType: TEvaluationType;
//    Score: Double;
//    Comment: string;
//  end;

//type
//  // كلاس الطالب يمثل بيانات الطالب الأساسية
//  // اتباع مبدأ المسؤولية الواحدة (SRP)
//  TStudent = class
//  private
//    FID: Integer;       // معرف الطالب
//    FName: string;      // اسم الطالب
//    FGrade: string;     // درجة الطالب
//    FEnrollmentDate: TDateTime;  // تاريخ الانضمام
//  public
//    constructor Create(ID: Integer; Name, Grade: string; EnrollmentDate: TDateTime);
//    function GetStudentInfo: string;  // عرض معلومات الطالب
//
//    property ID: Integer read FID write FID;
//    property Name: string read FName write FName;
//    property Grade: string read FGrade write FGrade;
//    property EnrollmentDate: TDateTime read FEnrollmentDate write FEnrollmentDate;
//  end;
//
//type
//  // كلاس الأساتذة يتعامل مع معلوماتهم الأساسية
//  // اتباع SRP بحيث تكون المسؤولية واضحة
//  TTeacher = class
//  private
//    FID: Integer;
//    FName: string;
//    FSpecialty: string;  // تخصص المعلم
//    FHireDate: TDateTime; // تاريخ التعيين
//  public
//    constructor Create(ID: Integer; Name, Specialty: string; HireDate: TDateTime);
//    function GetTeacherInfo: string;
//
//    property ID: Integer read FID write FID;
//    property Name: string read FName write FName;
//    property Specialty: string read FSpecialty write FSpecialty;
//    property HireDate: TDateTime read FHireDate write FHireDate;
//  end;
//
//type
//  // كلاس الحضور يتعامل مع حضور الطلاب في كل حصة
//  // اتباع مبدأ SRP (مسؤولية واحدة فقط)
//  TAttendance = class
//  private
//    FStudentID: Integer;
//    FClassID: Integer;
//    FDate: TDateTime;
//    FStatus: string;  // الحضور "حاضر" أو "غائب"
//  public
//    constructor Create(StudentID, ClassID: Integer; Date: TDateTime; Status: string);
//    function GetAttendanceStatus: string;
//
//    property StudentID: Integer read FStudentID write FStudentID;
//    property ClassID: Integer read FClassID write FClassID;
//    property Date: TDateTime read FDate write FDate;
//    property Status: string read FStatus write FStatus;
//  end;
//
//type
//  // كلاس جدول الحصص الدراسي
//  // يتبع SRP و DRY حيث يتم تحديد التفاصيل الخاصة بالحصص
//  TClassSchedule = class
//  private
//    FClassID: Integer;
//    FTeacherID: Integer;
//    FDayOfWeek: string;
//    FStartTime: TTime;
//    FEndTime: TTime;
//  public
//    constructor Create(ClassID, TeacherID: Integer; DayOfWeek: string; StartTime, EndTime: TTime);
//    function GetSchedule: string;
//
//    property ClassID: Integer read FClassID write FClassID;
//    property TeacherID: Integer read FTeacherID write FTeacherID;
//    property DayOfWeek: string read FDayOfWeek write FDayOfWeek;
//    property StartTime: TTime read FStartTime write FStartTime;
//    property EndTime: TTime read FEndTime write FEndTime;
//  end;

//******************************************************************************
type
//  // الجنس
//  TGender = (Male, Female);
//
//  // المرحلة
//  TLevel = (Preparatory, Kids, Adults);
  TGender = (gMale, gFemale);           // ذكر / أنثى
  TLevel = (lPreparatory, lSmall, lBig); // تحضيري / صغار / كبار


  // العلاقة
  TRelation = (Father, Mother, Uncle);

  // نوع الحصة
  TSessionType = (Hifdh, Review, Tajweed);

  // حالة الحضور
  TPresenceStatus = (Present, Absent);

  // كلاس الطالب
  // 🧒 كلاس الطالب - يمثل طالبًا في المدرسة
 TStudent = class
  private
    FFirstName: string;       // الاسم
    FLastName: string;        // اللقب
    FBirthDate: TDate;        // تاريخ الميلاد
    FGender: string; //TGender;         // الجنس
    FAge: Integer;            // العمر
    FAddress: string;         // العنوان
    FPhone: string;           // الهاتف
    FJoinDate: TDate;         // تاريخ الالتحاق
    FLevel: string; // TLevel;           // المستوى
    FGuardian: string;        // الولي
    FTeacher: string;         // المعلم
  public
     class procedure InsertStudent(ATable: TFDTable;
                                      const AFirstName, ALastName: string;
                                      ABirthDate: TDate;
                                      AAge: Integer;
                                      const AAddress, AGender, APhone: string;
                                      AEnrollmentDate: TDate;
                                      const ALevel: string;
                                      AGuardianID, ATeacherID: Integer;
                                      const AEmail:string);

    class procedure UpdateStudent(ATable: TFDTable);
    class procedure DeleteStudent(ATable: TFDTable;TabControl:TTabControl;Aitem:TTabItem);
    class procedure LoadStudents(ATable: TFDTable; AList: TList<TStudent>);overload; static;
    class procedure LoadStudents(ATable: TFDTable);overload; static;


    property FirstName: string read FFirstName write FFirstName;
    property LastName: string read FLastName write FLastName;
    property BirthDate: TDate read FBirthDate write FBirthDate;
    property Gender: string read FGender write FGender;
    property Age: Integer read FAge write FAge;
    property Address: string read FAddress write FAddress;
    property Phone: string read FPhone write FPhone;
    property JoinDate: TDate read FJoinDate write FJoinDate;
    property Level: string read FLevel write FLevel;
    property Guardian: string read FGuardian write FGuardian;
    property Teacher: string read FTeacher write FTeacher;
  end;
 // كلاس المعلم
 // 👨‍🏫 كلاس المعلم
  TTeacher = class
  private
    Ffirst_name: string;
    Flast_name: string;
    Faddress: string;
    Fphone: string;
    Fspecialization_id: string;
  public

    class procedure InsertTeacher(ATable: TFDTable;
                                      const AFirstName, ALastName: string;
                                      const AAddress, APhone: string;
                                      ASpecialtyID: Integer;
                                      const AEmail:string);
    class procedure UpdateTeacher(ATable: TFDTable);
    class procedure DeleteTeacher(ATable: TFDTable;TabControl:TTabControl;Aitem:TTabItem);
    class procedure LoadTeachers(ATable: TFDTable;AComboBox:TComboBox);static;

    property first_name: string read Ffirst_name write Ffirst_name;
    property last_name: string read Flast_name write Flast_name;
    property address: string read Faddress write Faddress;
    property phone: string read Fphone write Fphone;
    property specialization_id: string read Fspecialization_id write Fspecialization_id;
  end;

  // 👨‍👩‍👧 كلاس ولي الأمر - يمثل ولي أمر طالب أو أكثر
  TGuardian = class
  private
    FFirstName,FLastName,FRelation,FAddress,FPhone,FEmail:string;
  public
    class procedure InsertGuardian(ATable: TFDTable;
                                const AFirstName, ALastName,Arelationship: string;
                                const AAddress, APhone,AEmail: string
                                );
    class procedure UpdateGuardian(ATable: TFDTable);
    class procedure DeleteGuardian(ATable: TFDTable;TabControl:TTabControl;Aitem:TTabItem);
    class procedure LoadGuardians(ATable: TFDTable;AComboBox:TComboBox);static;

    property FirstName: string read FFirstName write FFirstName;
    property LastName: string read FLastName write FLastName;
    property Relation: string read FRelation write FRelation;
    property Address: string read FAddress write FAddress;
    property Phone: string read FPhone write FPhone;
    property Email: string read FEmail write FEmail;
    //property Students: TList<Integer> read FFirstName write FFirstName;; // List of Student IDs
  end;

    // 🎓 كلاس التخصص (مثلاً: تجويد، حفظ)
  TSpecialty = class
  public
//    ID: Integer;
//    Name: string;
    class procedure InsertSpecialty(ATable: TFDTable;const AName:string);
    class procedure UpdateSpecialty(ATable: TFDTable);
    class procedure DeleteSpecialty(ATable: TFDTable;TabControl:TTabControl;Aitem:TTabItem);
    class procedure LoadSpecialtys(ATable: TFDTable;AComboBox:TComboBox);static;
  end;
   // 📅 كلاس الحصة
  TSession = class
  public
    ID: Integer;
    Name: string;
    TeacherID: Integer;    // FK => TTeacher
    SpecialtyID: Integer;  // FK => TSpecialty
    Level: TLevel;
    DayOfWeek: string;
    TimeFrom: TTime;
    TimeTo: TTime;
  end;

  // ✅ كلاس الحضور والغياب
  TAttendance = class
  public
    ID: Integer;
    StudentID: Integer;    // FK => TStudent
    SessionID: Integer;    // FK => TSession
    Date: TDateTime;
    Status: TPresenceStatus;
  end;

  // 📖 كلاس التقييم (حفظ، مراجعة، تجويد)
  TEvaluation = class
  public
    ID: Integer;
    StudentID: Integer;    // FK => TStudent
    SurahName: string;
    FromVerse: Integer;
    ToVerse: Integer;
    Date: TDateTime;
    TeacherID: Integer;    // FK => TTeacher
    EvalType: TSessionType;
    Score: Double;
    Notes: string;
  end;

  // 📊 كلاس الإحصائيات
  TStatistics = class
  public
    TotalStudents: Integer;
    MaleStudents: Integer;
    FemaleStudents: Integer;
    TotalTeachers: Integer;
    TotalGuardians: Integer;
    TotalSessions: Integer;
    AttendancePresent: Integer;
    AttendanceAbsent: Integer;
    AvgEvaluationScore: Double;
  end;


//******************************************************************************
type
  THijriDate = record
    HijriDate: Integer;
    HijriMonth: Integer;
    HijriYear: Integer;
    JulianDate: Integer;
    HijriDay: string;
  end;

  function IntPart(Num: Real): Integer;
  function WeekDay(Wdn: Integer): string;
  function HijriMonths(Mth: Integer): string;
  function Gre2Hijri(var D, M, Y: Word): THijriDate;
  //function Gre2Hijri( D, M, Y: Word): THijriDate;
  function HijriToStr(const HijriDate: THijriDate): string;
  function HijriToLongStr(const HijriDate: THijriDate): string;
  function HijriToFullStr(const HijriDate: THijriDate): string;

  procedure GetHijriDateFromAPI;
  function GetFormattedHijriDateFromAPI(const AGregDate: string): string;


implementation

{$ifdef android}
uses
  Androidapi.JNI.Os,
  Androidapi.Helpers,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNIBridge,
  JavaAPI;
{$endif}

function StrToGender(const S: string): TGender;
begin
  if S = 'ذكر' then
    Result := gMale
  else
    Result := gFemale;
end;

function StrToLevel(const S: string): TLevel;
begin
  if S = 'تحضيري' then
    Result := lPreparatory
  else if S = 'صغار' then
    Result := lSmall
  else
    Result := lBig;
end;

function IntPart(Num: Real): Integer;
begin
  if Num < -0.0000001 then
    Result := Ceil(Num - 0.0000001)
  else
    Result := Floor(Num + 0.0000001);
end;

function WeekDay(Wdn: Integer): string;
begin
  case Wdn of
    0: Result := 'الإثنين';
    1: Result := 'الثلاثاء';
    2: Result := 'الأربعاء';
    3: Result := 'الخميس';
    4: Result := 'الجمعة';
    5: Result := 'السبت';
    6: Result := 'الأحد';
  else
    Result := '';
  end;
end;

function HijriMonths(Mth: Integer): string;
begin
  case Mth of
    1: Result := 'محرم';
    2: Result := 'صفر';
    3: Result := 'ربيع الأول';
    4: Result := 'ربيع الثاني';
    5: Result := 'جمادى الأول';
    6: Result := 'جمادى الثاني';
    7: Result := 'رجب';
    8: Result := 'شعبان';
    9: Result := 'رمضان';
    10: Result := 'شوال';
    11: Result := 'ذو القعدة';
    12: Result := 'ذو الحجة';
  else
    Result := 'غير معروف';
  end;
end;

function Gre2Hijri(var D, M, Y: Word): THijriDate;
var
  jd, l, n, j: Integer;
  m_, d_, y_: Word;
begin
  if ((Y > 1582) or ((Y = 1582) and (M > 10)) or ((Y = 1582) and (M = 10) and (D > 14))) then
  begin
    jd := IntPart((1461 * (Y + 4800 + IntPart((M - 14) / 12))) / 4) +
          IntPart((367 * (M - 2 - 12 * IntPart((M - 14) / 12))) / 12) -
          IntPart((3 * IntPart((Y + 4900 + IntPart((M - 14) / 12)) / 100)) / 4) +
          D - 32075;
  end
  else
  begin
    jd := 367 * Y - IntPart((7 * (Y + 5001 + IntPart((M - 9) / 7))) / 4) +
          IntPart((275 * M) / 9) + D + 1729777;
  end;

  l := jd - 1948440 + 10632;
  n := IntPart((l - 1) / 10631);
  l := l - 10631 * n + 354;

  j := (IntPart((10985 - l) / 5316)) * (IntPart((50 * l) / 17719)) +
       (IntPart(l / 5670)) * (IntPart((43 * l) / 15238));

  l := l - (IntPart((30 - j) / 15)) * (IntPart((17719 * j) / 50)) -
       (IntPart(j / 16)) * (IntPart((15238 * j) / 43)) + 29;

  m_ := IntPart((24 * l) / 709);
  d_ := l - IntPart((709 * m_) / 24);
  y_ := 30 * n + j - 30;

  Result.HijriDate := d_;
  Result.HijriMonth := m_;
  Result.HijriYear := y_;
  Result.JulianDate := jd;
  Result.HijriDay := WeekDay(jd mod 7);
end;

function HijriToStr(const HijriDate: THijriDate): string;
begin
  with HijriDate do
    Result := Format('%.2d/%.2d/%d', [HijriDate, HijriMonth, HijriYear]);
end;

function HijriToFullStr(const HijriDate: THijriDate): string;
begin
  with HijriDate do
    Result := Format('%s %.2d %s %d هـ', [
      HijriDay,
      HijriDate,
      HijriMonths(HijriMonth),
      HijriYear
    ]);
end;

function HijriToLongStr(const HijriDate: THijriDate): string;
begin
  with HijriDate do
    Result := Format('%.2d %s %d هـ', [
      HijriDate,
      HijriMonths(HijriMonth),
      HijriYear
    ]);
end;


//{ TStudent }
//
//constructor TStudent.Create(ID: Integer; Name, Grade: string;
//  EnrollmentDate: TDateTime);
//begin
//  FID := ID;
//  FName := Name;
//  FGrade := Grade;
//  FEnrollmentDate := EnrollmentDate;
//end;
//
//function TStudent.GetStudentInfo: string;
//begin
//  Result := Format('ID: %d, Name: %s, Grade: %s, Enrollment Date: %s',
//                   [FID, FName, FGrade, DateToStr(FEnrollmentDate)]);
//end;
//
//{ TAttendance }
//
//constructor TAttendance.Create(StudentID, ClassID: Integer; Date: TDateTime;
//  Status: string);
//begin
//  FStudentID := StudentID;
//  FClassID := ClassID;
//  FDate := Date;
//  FStatus := Status;
//end;
//
//function TAttendance.GetAttendanceStatus: string;
//begin
//  Result := Format('Student ID: %d, Class ID: %d, Date: %s, Status: %s',
//                   [FStudentID, FClassID, DateToStr(FDate), FStatus]);
//end;
//
//{ TTeacher }
//
//constructor TTeacher.Create(ID: Integer; Name, Specialty: string;
//  HireDate: TDateTime);
//begin
//  FID := ID;
//  FName := Name;
//  FSpecialty := Specialty;
//  FHireDate := HireDate;
//end;
//
//function TTeacher.GetTeacherInfo: string;
//begin
//  Result := Format('Teacher ID: %d, Name: %s, Specialty: %s, Hire Date: %s',
//                   [FID, FName, FSpecialty, DateToStr(FHireDate)]);
//end;
//
//{ TClassSchedule }
//
//constructor TClassSchedule.Create(ClassID, TeacherID: Integer;
//  DayOfWeek: string; StartTime, EndTime: TTime);
//begin
//  FClassID := ClassID;
//  FTeacherID := TeacherID;
//  FDayOfWeek := DayOfWeek;
//  FStartTime := StartTime;
//  FEndTime := EndTime;
//end;
//
//function TClassSchedule.GetSchedule: string;
//begin
//  Result := Format('Class ID: %d, Teacher ID: %d, Day: %s, Time: %s - %s',
//                   [FClassID, FTeacherID, FDayOfWeek, TimeToStr(FStartTime), TimeToStr(FEndTime)]);
//end;



procedure GetHijriDateFromAPI;
var
  HttpClient: THttpClient;
  Response: IHTTPResponse;
  JSONValue, Data, Hijri, Gregorian: TJSONObject;
  HijriDate, HijriMonth, HijriYear, HijriDay: string;
  GregorianDate: string;
begin
  HttpClient := THttpClient.Create;
  try
    // إرسال طلب إلى API
    Response := HttpClient.Get('https://api.aladhan.com/v1/gToH/16-07-2025?');

    // إذا كانت الاستجابة ناجحة
    if Response.StatusCode = 200 then
    begin
      // تحليل الاستجابة
      JSONValue := TJSONObject.ParseJSONValue(Response.ContentAsString) as TJSONObject;

      if Assigned(JSONValue) then
      begin
        // الوصول إلى بيانات التاريخ الهجري
        Data := JSONValue.GetValue<TJSONObject>('data');
        Hijri := Data.GetValue<TJSONObject>('hijri');

        // استخراج التاريخ الهجري
        HijriDate := Hijri.GetValue<string>('date'); // التاريخ الهجري
        HijriDay := Hijri.GetValue<string>('day');   // اليوم الهجري
        HijriMonth := Hijri.GetValue<string>('month.ar'); // اسم الشهر الهجري بالعربية
        HijriYear := Hijri.GetValue<string>('year');   // السنة الهجرية

        // الوصول إلى بيانات التاريخ الميلادي
        Gregorian := Data.GetValue<TJSONObject>('gregorian');
        GregorianDate := Gregorian.GetValue<string>('date');  // التاريخ الميلادي

        // عرض التاريخين
        ShowMessage('التاريخ الهجري: ' + HijriDate + ' - ' + HijriDay + ', ' + HijriMonth + ' ' + HijriYear);
        ShowMessage('التاريخ الميلادي: ' + GregorianDate);
      end;
    end
    else
    begin
      ShowMessage('فشل في الحصول على البيانات');
    end;
  finally
    HttpClient.Free;
  end;
end;

function GetFormattedHijriDateFromAPI(const AGregDate: string): string;
var
  HttpClient: THttpClient;
  Response: IHTTPResponse;
  JSONValue, Data, Hijri, HijriMonthObj, Gregorian, GregorianMonthObj: TJSONObject;
  HijriDay, HijriMonth, HijriWeekday, HijriYear: string;
  GregorianDay, GregorianMonth, GregorianYear: string;
begin
  Result := '';
  HttpClient := THttpClient.Create;
  try
    Response := HttpClient.Get('https://api.aladhan.com/v1/gToH/' + AGregDate);
    if Response.StatusCode = 200 then
    begin
      JSONValue := TJSONObject.ParseJSONValue(Response.ContentAsString) as TJSONObject;
      if Assigned(JSONValue) then
      try
        Data := JSONValue.GetValue<TJSONObject>('data');
        Hijri := Data.GetValue<TJSONObject>('hijri');
        Gregorian := Data.GetValue<TJSONObject>('gregorian');

        // التاريخ الهجري
        HijriDay := Hijri.GetValue<string>('day');
        HijriWeekday := Hijri.GetValue<TJSONObject>('weekday').GetValue<string>('ar');
        HijriMonthObj := Hijri.GetValue<TJSONObject>('month');
        HijriMonth := HijriMonthObj.GetValue<string>('ar');
        HijriYear := Hijri.GetValue<string>('year');

        // التاريخ الميلادي
        GregorianDay := Gregorian.GetValue<string>('day');
        GregorianYear := Gregorian.GetValue<string>('year');
        GregorianMonthObj := Gregorian.GetValue<TJSONObject>('month');
        GregorianMonth := GregorianMonthObj.GetValue<string>('en');

        // ترجمة اسم الشهر الميلادي من الإنجليزية إلى الفرنسية أو العربية
        if SameText(GregorianMonth, 'July') then
          GregorianMonth := 'جويلية'
        else if SameText(GregorianMonth, 'August') then
          GregorianMonth := 'أوت'
        else if SameText(GregorianMonth, 'September') then
          GregorianMonth := 'سبتمبر'
        else if SameText(GregorianMonth, 'October') then
          GregorianMonth := 'أكتوبر'
        else if SameText(GregorianMonth, 'November') then
          GregorianMonth := 'نوفمبر'
        else if SameText(GregorianMonth, 'December') then
          GregorianMonth := 'ديسمبر'
        else if SameText(GregorianMonth, 'June') then
          GregorianMonth := 'جوان'
        else if SameText(GregorianMonth, 'May') then
          GregorianMonth := 'ماي'
        else if SameText(GregorianMonth, 'April') then
          GregorianMonth := 'أفريل'
        else if SameText(GregorianMonth, 'March') then
          GregorianMonth := 'مارس'
        else if SameText(GregorianMonth, 'February') then
          GregorianMonth := 'فيفري'
        else if SameText(GregorianMonth, 'January') then
          GregorianMonth := 'جانفي';

        // تكوين النتيجة النهائية
        Result := Format('%s %s %s/%s %s %s',
          [HijriWeekday, HijriDay, HijriMonth,
           GregorianDay, GregorianMonth, GregorianYear]);

      finally
        JSONValue.Free;
      end;
    end
    else
      Result := 'فشل في الاتصال بـ API';
  finally
    HttpClient.Free;
  end;
end;

{ TStudent }

class procedure TStudent.DeleteStudent(ATable: TFDTable;TabControl:TTabControl;Aitem:TTabItem);
{$ifdef android}
var
  Vibrator:JVibrator;
{$endif}
begin
{$ifdef android}
  Vibrator:=TJVibrator.Wrap(( TAndroidHelper.Context.getSystemService(TJContext.JavaClass.VIBRATOR_SERVICE)as ilocalobject).GetObjectID);
  Vibrator.vibrate(400);
{$endif}
  TDialogService.MessageDialog('هل أنت متأكد من الحذف', System.UITypes.TMsgDlgType.mtInformation,
    [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo],
    System.UITypes.TMsgDlgBtn.mbYes, 0,
    procedure(const AResult: TModalResult)
    begin
      case AResult of
        mrYES:begin
                ATable.Delete;
                {$ifdef android}
                 Toast('تم الحذف بنجاح');
                {$else}
                 ShowMessage('تم الحدف');
                {$endif}
                TabControl.SetActiveTabWithTransition(Aitem, TTabTransition.Slide);
              end;
        mrNo:;
      end;
    end);
end;

//class procedure TStudent.InsertStudent(ATable: TFDTable;AForm:TForm);
//begin
//  ATable.Append;
//  with ATable do
//  begin
//    FieldByName('first_name').AsWideString := AForm.Edit1.Text;
//    FieldByName('last_name').AsWideString := Form1.Edit10.Text;
//    FieldByName('birth_date').AsDateTime := Form1.DateEdit1.Date;
//    FieldByName('age').AsInteger := Form1.Edit7.Text.ToInteger;
//    FieldByName('address').AsWideString := Form1.Edit6.Text;
//    FieldByName('gender').AsWideString := Form1.ComboBox1.Text;
//    FieldByName('phone').AsString := Form1.Edit5.Text;
//    FieldByName('enrollment_date').AsDateTime := Form1.DateEdit2.Date;
//    FieldByName('level').AsWideString := Form1.ComboBox2.Text;
//
//    if Form1.ComboBox3.ItemIndex > -1 then
//      FieldByName('guardian_id').AsInteger := Form1.ComboBox3.ItemIndex + 1;
//
//    if Form1.ComboBox4.ItemIndex > -1 then
//      FieldByName('teacher_id').AsInteger := Form1.ComboBox4.ItemIndex + 1;
//
//    Post;
//  end;
//
//  ShowMessage('تمت الإضافة بنجاح');
//  Form1.TabControl1.SetActiveTabWithTransition(Form1.TabItem1, TTabTransition.Slide);
//end;


class procedure TStudent.InsertStudent(ATable: TFDTable; const AFirstName,
  ALastName: string; ABirthDate: TDate; AAge: Integer; const AAddress, AGender,
  APhone: string; AEnrollmentDate: TDate; const ALevel: string; AGuardianID,
  ATeacherID: Integer;const AEmail:string);
begin
  ATable.Append;
  with ATable do
  begin
    FieldByName('first_name').AsWideString := AFirstName;
    FieldByName('last_name').AsWideString := ALastName;
    FieldByName('birth_date').AsDateTime := ABirthDate;
    FieldByName('age').AsInteger := AAge;
    FieldByName('address').AsWideString := AAddress;
    FieldByName('gender').AsWideString := AGender;
    FieldByName('phone').AsString := APhone;
    FieldByName('email').AsWideString := AEmail;
    FieldByName('enrollment_date').AsDateTime := AEnrollmentDate;
    FieldByName('level').AsWideString := ALevel;

    if AGuardianID > 0 then
      FieldByName('guardian_id').AsInteger := AGuardianID;

    if ATeacherID > 0 then
      FieldByName('teacher_id').AsInteger := ATeacherID;

    Post;
  end;
end;

class procedure TStudent.LoadStudents(ATable: TFDTable);
begin
  ATable.First;
  while not ATable.Eof do
  begin

    //(
//      ATable.FieldByName('ID').AsInteger,
//      ATable.FieldByName('Name').AsString,
//      ATable.FieldByName('Grade').AsString,
//      ATable.FieldByName('EnrollmentDate').AsDateTime
//    );
    ATable.Next;
  end;
end;

class procedure TStudent.LoadStudents(ATable: TFDTable; AList: TList<TStudent>);
var
  student: TStudent;
begin
  AList.Clear;
  ATable.First;
  while not ATable.Eof do
  begin
    student := TStudent.Create;
    //(
//      ATable.FieldByName('ID').AsInteger,
//      ATable.FieldByName('Name').AsString,
//      ATable.FieldByName('Grade').AsString,
//      ATable.FieldByName('EnrollmentDate').AsDateTime
//    );
    AList.Add(student);
    ATable.Next;
  end;
end;


class procedure TStudent.UpdateStudent(ATable: TFDTable);
begin
//  if ATable.Locate('ID', FID, []) then
//  begin
//    ATable.Edit;
//    ATable.FieldByName('Name').AsString := FName;
//    ATable.FieldByName('Grade').AsString := FGrade;
//    ATable.FieldByName('EnrollmentDate').AsDateTime := FEnrollmentDate;
//    ATable.Post;
//  end;
end;

{ TTeacher }

class procedure TTeacher.DeleteTeacher(ATable: TFDTable;TabControl:TTabControl;Aitem:TTabItem);
{$ifdef android}
var
  Vibrator:JVibrator;
{$endif}
begin
{$ifdef android}
  Vibrator:=TJVibrator.Wrap(( TAndroidHelper.Context.getSystemService(TJContext.JavaClass.VIBRATOR_SERVICE)as ilocalobject).GetObjectID);
  Vibrator.vibrate(400);
{$endif}
  TDialogService.MessageDialog('هل أنت متأكد من الحذف', System.UITypes.TMsgDlgType.mtInformation,
    [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo],
    System.UITypes.TMsgDlgBtn.mbYes, 0,
    procedure(const AResult: TModalResult)
    begin
      case AResult of
        mrYES:begin
                ATable.Delete;
                {$ifdef android}
                 Toast('تم الحذف بنجاح');
                {$else}
                 ShowMessage('تم الحدف');
                {$endif}
                TabControl.SetActiveTabWithTransition(Aitem, TTabTransition.Slide);
              end;
        mrNo:;
      end;
    end);
end;

class procedure TTeacher.InsertTeacher(ATable: TFDTable; const AFirstName,
  ALastName, AAddress, APhone: string; ASpecialtyID: Integer;const AEmail:string);
begin
  ATable.Append;
  with ATable do
  begin
    FieldByName('first_name').AsWideString := AFirstName;
    FieldByName('last_name').AsWideString := ALastName;
    FieldByName('address').AsWideString := AAddress;
    FieldByName('phone').AsString := APhone;
    FieldByName('email').AsString := AEmail;
    if ASpecialtyID > 0 then
      FieldByName('specialization_id').AsInteger := ASpecialtyID;

    Post;
  end;
end;

class procedure TTeacher.LoadTeachers(ATable: TFDTable; AComboBox: TComboBox);
var
  TeacherFullName: string;
begin
  AComboBox.Clear; // تنظيف العناصر القديمة في ComboBox

  // التأكد من أن الجدول مفتوح
  if not ATable.Active then
    ATable.Open;

  ATable.First;
  while not ATable.Eof do
  begin
    // تركيب الاسم الكامل
    TeacherFullName :=
      ATable.FieldByName('first_name').AsWideString + ' ' +
      ATable.FieldByName('last_name').AsWideString;

    // إضافة الاسم الكامل إلى ComboBox
    AComboBox.Items.Add(TeacherFullName);

    ATable.Next;
  end;
end;

class procedure TTeacher.UpdateTeacher(ATable: TFDTable);
begin

end;

{ TGuardian }

class procedure TGuardian.DeleteGuardian(ATable: TFDTable;TabControl:TTabControl;Aitem:TTabItem);
{$ifdef android}
var
  Vibrator:JVibrator;
{$endif}
begin
{$ifdef android}
  Vibrator:=TJVibrator.Wrap(( TAndroidHelper.Context.getSystemService(TJContext.JavaClass.VIBRATOR_SERVICE)as ilocalobject).GetObjectID);
  Vibrator.vibrate(400);
{$endif}
  TDialogService.MessageDialog('هل أنت متأكد من الحذف', System.UITypes.TMsgDlgType.mtInformation,
    [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo],
    System.UITypes.TMsgDlgBtn.mbYes, 0,
    procedure(const AResult: TModalResult)
    begin
      case AResult of
        mrYES:begin
                ATable.Delete;
                {$ifdef android}
                 Toast('تم الحذف بنجاح');
                {$else}
                 ShowMessage('تم الحدف');
                {$endif}
                TabControl.SetActiveTabWithTransition(Aitem, TTabTransition.Slide);
              end;
        mrNo:;
      end;
    end);
end;


class procedure TGuardian.InsertGuardian(ATable: TFDTable; const AFirstName,
  ALastName, Arelationship, AAddress, APhone, AEmail: string);
begin
  ATable.Append;
  with ATable do
  begin
    FieldByName('first_name').AsWideString := AFirstName;
    FieldByName('last_name').AsWideString := ALastName;
    //FieldByName('relationship').AsWideString := Arelationship;
    FieldByName('address').AsWideString := AAddress;
    FieldByName('phone').AsString := APhone;
    FieldByName('email').AsWideString := AEmail;
    Post;
  end;
end;

class procedure TGuardian.LoadGuardians(ATable: TFDTable; AComboBox: TComboBox);
var
  GuardianFullName: string;
begin
  AComboBox.Clear; // تنظيف العناصر القديمة في ComboBox

  // التأكد من أن الجدول مفتوح
  if not ATable.Active then
    ATable.Open;

  ATable.First;
  while not ATable.Eof do
  begin
    // تركيب الاسم الكامل
    GuardianFullName :=
      ATable.FieldByName('first_name').AsWideString + ' ' +
      ATable.FieldByName('last_name').AsWideString;

    // إضافة الاسم الكامل إلى ComboBox
    AComboBox.Items.Add(GuardianFullName);

    ATable.Next;
  end;
end;

class procedure TGuardian.UpdateGuardian(ATable: TFDTable);
begin

end;

{ TSpecialty }

class procedure TSpecialty.DeleteSpecialty(ATable: TFDTable; TabControl: TTabControl;
  Aitem: TTabItem);
{$ifdef android}
var
  Vibrator:JVibrator;
{$endif}
begin
{$ifdef android}
  Vibrator:=TJVibrator.Wrap(( TAndroidHelper.Context.getSystemService(TJContext.JavaClass.VIBRATOR_SERVICE)as ilocalobject).GetObjectID);
  Vibrator.vibrate(400);
{$endif}
  TDialogService.MessageDialog('هل أنت متأكد من الحذف', System.UITypes.TMsgDlgType.mtInformation,
    [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo],
    System.UITypes.TMsgDlgBtn.mbYes, 0,
    procedure(const AResult: TModalResult)
    begin
      case AResult of
        mrYES:begin
                ATable.Delete;
                {$ifdef android}
                 Toast('تم الحذف بنجاح');
                {$else}
                 ShowMessage('تم الحدف');
                {$endif}
                TabControl.SetActiveTabWithTransition(Aitem, TTabTransition.Slide);
              end;
        mrNo:;
      end;
    end);
end;

class procedure TSpecialty.InsertSpecialty(ATable: TFDTable;const AName:string);
begin
  ATable.Append;
  with ATable do
  begin
    FieldByName('name').AsWideString := AName;
    Post;
  end;
end;

class procedure TSpecialty.LoadSpecialtys(ATable: TFDTable;
  AComboBox: TComboBox);
var
  Specialty: string;
begin
  AComboBox.Clear; // تنظيف العناصر القديمة في ComboBox

  // التأكد من أن الجدول مفتوح
  if not ATable.Active then
    ATable.Open;

  ATable.First;
  while not ATable.Eof do
  begin
    // تركيب الاسم الكامل
    Specialty :=ATable.FieldByName('name').AsWideString;

    // إضافة الاسم الكامل إلى ComboBox
    AComboBox.Items.Add(Specialty);

    ATable.Next;
  end;
end;

class procedure TSpecialty.UpdateSpecialty(ATable: TFDTable);
begin

end;

end.

