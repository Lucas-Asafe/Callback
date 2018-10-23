unit ufrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DBXJSON,
  System.JSON, Datasnap.DSCommon, Datasnap.DSSession, Data.DbxDatasnap, Data.DBXCommon,
  IPPeerClient, Data.DB, Data.SqlExpr, Datasnap.DSProxy;

type
  TMyCallback = class(TDBXCallback)
  public
    function Execute(const Arg: TJSONValue): TJSONValue; override;
  end;

  TfrmMain = class(TForm)
    mmo: TMemo;
    callback: TDSClientCallbackChannelManager;
    con: TSQLConnection;
    edtMessage: TEdit;
    btnEnviar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
  private
    FMyCallbackName: string;
    procedure LogMsg(const s: string);
    procedure QueueLogMsg(const s: string);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

{ TMyCallback }

function TMyCallback.Execute(const Arg: TJSONValue): TJSONValue;
begin
  frmMain.QueueLogMsg(Arg.ToString);
  Result := TJSONTrue.Create;
end;

{ TfrmMain }

procedure TfrmMain.btnEnviarClick(Sender: TObject);
var
  Client: TDSAdminClient;
begin
  Client := TDSAdminClient.Create(con.DBXConnection);
  try
    // propagar mensagem para todos clientes ouvindo o canal
    Client.BroadcastToChannel(callback.ChannelName, TJSONString.Create(edtMessage.Text));
  finally
    FreeAndNil(Client);
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  callback.ManagerId := TDSTunnelSession.GenerateSessionId;
  FMyCallbackName := TDSTunnelSession.GenerateSessionId;
  callback.RegisterCallback(FMyCallbackName, TMyCallback.Create);
end;

procedure TfrmMain.LogMsg(const s: string);
begin
  mmo.Lines.Add(s);
end;

procedure TfrmMain.QueueLogMsg(const s: string);
begin
  TThread.Queue(nil,
    procedure
    begin
      LogMsg(s);
    end);
end;

end.

