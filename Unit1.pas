unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ClipBrd, XPMan, Jpeg, ExtDlgs, Menus;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Image1: TImage;
    XPManifest1: TXPManifest;
    ColorDialog1: TColorDialog;
    OpenPictureDialog1: TOpenPictureDialog;
    Label1: TLabel;
    SaveDialog1: TSaveDialog;
    MainMenu1: TMainMenu;
    Afqk1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    BGR5651: TMenuItem;
    RGB5651: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    RGB5652: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    procedure N1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure RGB5652Click(Sender: TObject);
    procedure BGR5651Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure Afqk1Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  stat: string;

implementation

{$R *.dfm}

procedure TForm1.N1Click(Sender: TObject);
var bp:TBitmap;
size: integer;
begin
if openpicturedialog1.Execute then
memo1.Clear;
image1.Picture.LoadFromFile(openpicturedialog1.FileName);
bp:=TBitmap.Create;
bp.Assign(image1.picture.Graphic);
image1.picture.Bitmap.Assign(bp);
size:= image1.Picture.Height*image1.Picture.Width*2;
label1.Caption:=inttostr(image1.picture.height)+'x'+inttostr(image1.picture.Width)+' = '+ inttostr(size)+' Байт ('+floattostrf(size/1024, ffFixed, 4, 2)+' КБайт)';
end;

procedure TForm1.N6Click(Sender: TObject);
begin
memo1.SelectAll;
memo1.CopyToClipboard;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
memo1.Clear;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.RGB5652Click(Sender: TObject);
var r,g,b, i, n, rgb565: integer;
c:LongInt;
s: string;
begin
stat:='rgb';
memo1.Clear;
for n:=0 to image1.Picture.height-1 do
  begin
  for i:=0 to image1.Picture.width-1 do
    begin
    c:=ColorToRGB(image1.Canvas.Pixels[i, n]);
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

procedure TForm1.BGR5651Click(Sender: TObject);
var r,g,b, i, n, bgr565: integer;
c:LongInt;
s: string;
begin
stat:='bgr';
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

procedure TForm1.N12Click(Sender: TObject);
var r,g,b, rgb565, bgr565: integer;
c:LongInt;
begin
if colordialog1.Execute then
    begin
    c:=ColorToRGB(colordialog1.Color);
    r:=round(GetRValue(c)*31/255);
    g:=round(GetGValue(c)*63/255);
    b:=round(GetBValue(c)*31/255);
    rgb565:=(r shl 11)or(g shl 5)or(b);
    bgr565:=(b shl 11)or(g shl 5)or(r);
    memo1.Text:='color rgb565: 0x'+inttohex(rgb565,1);
    memo1.lines.add('color bgr565: 0x'+inttohex(bgr565,1));
    end;
end;

procedure TForm1.Afqk1Click(Sender: TObject);
begin
if stat='' then
N3.Enabled:=false;
if (stat='bgr') or (stat='rgb') then
N3.Enabled:=true;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
showmessage('by Dmitriy Ivanov 2023');
end;

procedure TForm1.N3Click(Sender: TObject);
var
  byte1, byte2: byte;
  fs: TFileStream;
  r,g,b, i, n, bgr565: integer;
c:LongInt;
begin
if savedialog1.Execute then
fs := TFileStream.Create(savedialog1.FileName, fmCreate or fmOpenReadWrite or fmShareDenyWrite);
fs.Seek(0, soFromBeginning);
for n:=0 to image1.Picture.height-1 do
  begin
  for i:=0 to image1.Picture.width-1 do
    begin
    c:=ColorToRGB(image1.Picture.Bitmap.Canvas.Pixels[i, n]);
    r:=round(GetRValue(c)*31/255);
    g:=round(GetGValue(c)*63/255);
    b:=round(GetBValue(c)*31/255);
    bgr565:=(b shl 11)or(g shl 5)or(r);
    byte1:=hi(bgr565);
    byte2:=lo(bgr565);
    fs.Write(byte1,sizeof(byte1));
    fs.Write(byte2,sizeof(byte2));
    end;
  end;

  fs.Free;

end;

end.
