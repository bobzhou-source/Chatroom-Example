unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Win.ScktComp,
  sSkinManager;

type
  TForm1 = class(TForm)
    ServerSocket1: TServerSocket;
    Memo1: TMemo;
    Button1: TButton;
    Edit1: TEdit;
    sSkinManager1: TsSkinManager;
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure Button1Click(Sender: TObject);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
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
self.ServerSocket1.Socket.Connections[0].SendText('Server Says: ' + self.Edit1.Text);
self.Memo1.Lines.Add('You Said: ' + self.Edit1.Text);
self.Edit1.Clear;
self.Edit1.SetFocus;
end;

procedure TForm1.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
self.Memo1.Lines.Add('Someone Connected from IP: ' + socket.RemoteAddress);
end;

procedure TForm1.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
self.Memo1.Lines.Add('Someone Disconnected From IP: ' + socket.RemoteAddress);
end;

procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
  var
  data:string;
  begin
  data:= socket.ReceiveText;
  self.Memo1.Lines.Add(data);
end;

end.
