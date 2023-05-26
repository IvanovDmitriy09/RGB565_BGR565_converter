unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ClipBrd, XPMan, Jpeg, ExtDlgs, Menus, Grids, math;

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
    StringGrid1: TStringGrid;
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
    procedure N5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
size, i: integer;
begin
if openpicturedialog1.Execute then
begin
memo1.Clear;
image1.Picture.LoadFromFile(openpicturedialog1.FileName);
bp:=TBitmap.Create;
bp.Assign(image1.picture.Graphic);
image1.picture.Bitmap.Assign(bp);
size:= image1.Picture.Height*image1.Picture.Width*2;
label1.Caption:=inttostr(image1.picture.height)+'x'+inttostr(image1.picture.Width)+' = '+ inttostr(size)+' ���� ('+floattostrf(size/1024, ffFixed, 4, 2)+' �����)';
stat:='img';
//form1.Width:=1400;
stringgrid1.RowCount:=ceil(size/16)+1;
for i:=0 to stringgrid1.RowCount-1 do
begin
stringgrid1.Cells[0, i+1]:=inttohex(i+10,1);
end;
end;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
memo1.SelectAll;
memo1.CopyToClipboard;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
memo1.Clear;
stat:='img';
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
    image1.Picture:= nil;
    label1.Caption:='';
    stat:='';
    form1.Width:=479;
    end;

end;

procedure TForm1.Afqk1Click(Sender: TObject);
begin
if (stat='bgr') or (stat='rgb') then
N3.Enabled:=true else
N3.Enabled:=false;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
showmessage('������� ������ 2023');
end;

procedure TForm1.N3Click(Sender: TObject);
var
  byte1, byte2: byte;
  fs: TFileStream;
  r,g,b, i, n, bgr565, rgb565: integer;
c:LongInt;
begin
if savedialog1.Execute then
begin
fs := TFileStream.Create(savedialog1.FileName, fmCreate or fmOpenReadWrite or fmShareDenyWrite);
fs.Seek(0, soFromBeginning);
if stat='bgr' then
begin
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
end else if stat='rgb' then
begin
for n:=0 to image1.Picture.height-1 do
  begin
  for i:=0 to image1.Picture.width-1 do
    begin
    c:=ColorToRGB(image1.Canvas.Pixels[i, n]);
    r:=round(GetRValue(c)*31/255);
    g:=round(GetGValue(c)*63/255);
    b:=round(GetBValue(c)*31/255);
    rgb565:=(r shl 11)or(g shl 5)or(b);
    byte1:=hi(rgb565);
    byte2:=lo(rgb565);
    fs.Write(byte1,sizeof(byte1));
    fs.Write(byte2,sizeof(byte2));
    end;
  end;
  fs.Free;
end;

end;

end;

procedure TForm1.N5Click(Sender: TObject);
begin
if (stat='img')or (stat='rgb') or (stat='bgr') then
begin
BGR5651.Enabled:=true;
RGB5652.Enabled:=true;
end else
begin
BGR5651.Enabled:=false;
RGB5652.Enabled:=false;
end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
i: byte;
begin
for i:=0 to 15 do
begin
stringgrid1.Cells[i+1, 0]:=inttohex(i,1);
end;

end;

end.
