unit ConexaoForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Vcl.Buttons;

type
  TConexaoFrm = class(TForm)
    Label1: TLabel;
    edtHost: TEdit;
    Label2: TLabel;
    edtLogin: TEdit;
    Label3: TLabel;
    edtPorta: TEdit;
    Label4: TLabel;
    edtSenha: TEdit;
    btnFechar: TBitBtn;
    ActionList1: TActionList;
    actFechar: TAction;
    actConectar: TAction;
    btnConectar: TBitBtn;
    procedure actFecharExecute(Sender: TObject);
    procedure actConectarExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ConexaoFrm: TConexaoFrm;

implementation

{$R *.dfm}

procedure TConexaoFrm.actConectarExecute(Sender: TObject);
begin
//
end;

procedure TConexaoFrm.actFecharExecute(Sender: TObject);
begin
  Close;
end;

end.