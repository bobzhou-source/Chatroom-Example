unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Win.ScktComp;

type
  TForm1 = class(TForm)
    ClientSocket1: TClientSocket;
    Memo1: TMemo;
    Edit1: TEdit;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ClientSocket1Connect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure Button1Click(Sender: TObject);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
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
self.ClientSocket1.Socket.SendText('Client Says: ' + self.Edit1.Text);
self.Memo1.Lines.Add('You Said: ' + self.Edit1.Text);
self.Edit1.Clear;
self.Edit1.SetFocus;
end;

procedure TForm1.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
self.Memo1.Lines.Add('You have connected to Server at IP: ' + socket.RemoteAddress);
end;

procedure TForm1.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
self.Memo1.Lines.Add('You have disconnected from the server!');
end;

procedure TForm1.ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
var
data:string;
begin
data:= socket.ReceiveText;
self.Memo1.Lines.Add(data);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
self.ClientSocket1.Host:='47.229.105.95';
self.ClientSocket1.Port:=3434;
self.ClientSocket1.Open;
end;

end.
