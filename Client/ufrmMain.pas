unit ufrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DBXJSON,
  System.JSON, Datasnap.DSCommon, Datasnap.DSSession;

type
  TMyCallback = class(TDBXCallback)
    function Execute(Arg: TJSONValue): TJSONValue; override;
  end;

  TfrmMain = class(TForm)
    mmo: TMemo;
    callback: TDSClientCallbackChannelManager;
    procedure FormCreate(Sender: TObject);
  private
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

function TMyCallback.Execute(Arg: TJSONValue): TJSONValue;
begin
  frmMain.QueueLogMsg(Arg.ToString);
  Result := TJSONTrue.Create;
end;

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  callback.ManagerId := TDSTunnelSession.GenerateSessionId;
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
