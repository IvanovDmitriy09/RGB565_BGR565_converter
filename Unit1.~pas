unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ClipBrd, XPMan;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    Image1: TImage;
    Button3: TButton;
    Button4: TButton;
    XPManifest1: TXPManifest;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
if opendialog1.Execute then
image1.Picture.LoadFromFile(opendialog1.FileName);
end;

procedure TForm1.Button2Click(Sender: TObject);
var r,g,b, i, n, bgr565: integer;
c:LongInt;
s: string;
begin
memo1.Clear;
for n:=0 to image1.Picture.height-1 do
  begin
  for i:=0 to image1.Picture.width-1 do
    begin
    c:=ColorToRGB(image1.Picture.Bitmap.Canvas.Pixels[i, n]);
    r:=round(GetRValue(c)*31/255);
    g:=round(GetGValue(c)*63/255);
    b:=round(GetBValue(c)*31/255);
    bgr565:=(b shl 11)or(g shl 5)or(r);
    s:=s+'0x'+inttohex(hi(bgr565),1)+', 0x'+inttohex(lo(bgr565),1)+', ';
    end;
    memo1.Lines.Add(s);
    s:='';
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var r,g,b, i, n, rgb565: integer;
c:LongInt;
s: string;
begin
memo1.Clear;
for n:=0 to image1.Picture.height-1 do
  begin
  for i:=0 to image1.Picture.width-1 do
    begin
    c:=ColorToRGB(image1.Picture.Bitmap.Canvas.Pixels[i, n]);
    r:=round(GetRValue(c)*31/255);
    g:=round(GetGValue(c)*63/255);
    b:=round(GetBValue(c)*31/255);
    rgb565:=(r shl 11)or(g shl 5)or(b);
    s:=s+'0x'+inttohex(hi(rgb565),1)+', 0x'+inttohex(lo(rgb565),1)+', ';
    end;
    memo1.Lines.Add(s);
    s:='';
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
memo1.SelectAll;
memo1.CopyToClipboard;
end;

end.
