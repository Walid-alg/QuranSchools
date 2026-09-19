unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.ListBox;

type
  TForm2 = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    Label1: TLabel;
    VertScrollBox1: TVertScrollBox;
    Layout2: TLayout;
    Label2: TLabel;
    Layout3: TLayout;
    Label3: TLabel;
    Switch1: TSwitch;
    Image1: TImage;
    Line1: TLine;
    StyleBook1: TStyleBook;
    StyleBook2: TStyleBook;
    StyleBook3: TStyleBook;
    Layout4: TLayout;
    Layout10: TLayout;
    Label8: TLabel;
    Layout11: TLayout;
    Label9: TLabel;
    ComboBox2: TComboBox;
    Image5: TImage;
    Layout12: TLayout;
    Label10: TLabel;
    Image6: TImage;
    Switch3: TSwitch;
    Layout13: TLayout;
    Label11: TLabel;
    Image7: TImage;
    Line2: TLine;
    Lang1: TLang;
    ComboBox1: TComboBox;
    Layout5: TLayout;
    Label4: TLabel;
    Layout6: TLayout;
    Label5: TLabel;
    Switch2: TSwitch;
    Image2: TImage;
    Layout7: TLayout;
    Image3: TImage;
    Label6: TLabel;
    ComboBox3: TComboBox;
    Layout8: TLayout;
    Label7: TLabel;
    Image4: TImage;
    Switch4: TSwitch;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: WideChar;
      Shift: TShiftState);
    procedure Switch1Switch(Sender: TObject);
    procedure Switch4Switch(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
    number_tag:Integer;

  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

uses Unit1,
  ioutils;


procedure TForm2.Button1Click(Sender: TObject);
begin
  Self.StyleBook:=StyleBook2;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Self.StyleBook:=StyleBook1;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  Self.StyleBook:=StyleBook3;
end;

procedure TForm2.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: WideChar; Shift: TShiftState);
begin
  Form1.Back(Self, Key);
end;

procedure TForm2.FormShow(Sender: TObject);
begin
  Self.StyleBook:=Form1.StyleBook;
end;

procedure TForm2.Switch1Switch(Sender: TObject);
var
  ThemeIndex: Integer;
  ThemeStyle: TStyleBook;

  procedure SaveThemeSetting(Index: Integer);
  var
    SL: TStringList;
  begin
    SL := TStringList.Create;
    try
      SL.Add(Index.ToString);
      SL.SaveToFile(TPath.GetDocumentsPath + PathDelim + 'setting.txt');
    finally
      SL.Free;
    end;
  end;

begin
  if not Switch1.IsChecked then
  begin
    // الوضع الليلي مغلق – نطبق الثيم الفاتح
    ThemeIndex := 0;
    ThemeStyle := StyleBook2;
  end
  else
  begin
    // الوضع الليلي مفعل – نتنقل بين الثيم 1 و 2
    Inc(number_tag);
    if number_tag > 2 then
      number_tag := 1;

    ThemeIndex := number_tag;
    case number_tag of
      1: ThemeStyle := StyleBook1;  // Android Dark theme
      2: ThemeStyle := StyleBook3;  // Android Dark2 theme
    else
      ThemeStyle := StyleBook2;     // Backup (shouldn’t happen)
    end;
  end;

  // تطبيق الثيم
  Self.StyleBook := ThemeStyle;

  // حفظ الإعداد
  SaveThemeSetting(ThemeIndex);
end;

procedure TForm2.Switch4Switch(Sender: TObject);
begin
  Switch4.IsChecked:=Form1.ActiveLayout;
end;

end.
