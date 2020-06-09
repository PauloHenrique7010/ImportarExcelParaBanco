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
    Label5: TLabel;
    edtBD: TEdit;
    procedure actFecharExecute(Sender: TObject);
    procedure actConectarExecute(Sender: TObject);
  private
    function confirmar:boolean;
  public
    procedure Iniciar;
  end;

var
  ConexaoFrm: TConexaoFrm;

implementation

{$R *.dfm}

uses ConexaoData, IniFiles, PrincipalForm, FireDAC.Comp.Client;

procedure TConexaoFrm.actConectarExecute(Sender: TObject);
var
  conexaoIni : Tinifile;
  cmd : TFDCommand;
begin
  if (confirmar) then
  begin
    try
      ConexaoDtm.Conexao.Connected := False;
      ConexaoDtm.Conexao.Params.Values['DriverID']  := 'MySQL';
      ConexaoDtm.Conexao.Params.Values['Server']    := edtHost.Text;
      ConexaoDtm.Conexao.Params.Values['User_name'] := edtLogin.Text;
      ConexaoDtm.Conexao.Params.Values['Password']  := edtSenha.Text;
      ConexaoDtm.Conexao.Params.Values['Port']      := edtPorta.Text;
      ConexaoDtm.Conexao.Connected := True;

      cmd := TFDCommand.Create(nil);
      try
        cmd.Connection := ConexaoDtm.Conexao;
        cmd.CommandText.Text := 'CREATE DATABASE IF NOT EXISTS '+edtBd.Text;
        cmd.Execute();
        cmd.CommandText.Text := 'USE '+edtBD.Text+';';
        cmd.Execute();
        cmd.CommandTExt.Text := 'CREATE TABLE IF NOT EXISTS '+PrincipalFrm.tabela+' (codigo int primary key auto_increment);';
        cmd.Execute();
        //se conseguiu criar o banco de dados com o database, adiciona aos parametros
        ConexaoDtm.Conexao.Params.Values['Database']  := edtBD.Text;


        conexaoIni := TIniFile.Create(PrincipalFrm.caminhoEXE+'\Conexao.ini');

        conexaoIni.WriteString('Conexao', 'User_name',edtLogin.Text);
        conexaoIni.WriteString('Conexao', 'Password', edtSenha.Text);
        conexaoIni.WriteString('Conexao', 'DriverID', 'MySQL');
        conexaoIni.WriteString('Conexao', 'Server', edtHost.Text);
        conexaoIni.WriteString('Conexao', 'Database', edtBD.Text);
        conexaoIni.WriteString('Conexao', 'Port', edtPorta.Text);

        conexaoIni.Free;
        Close;

      finally
        cmd.Free;
      end;
      Application.MessageBox('Conectado com sucesso! ser� criado um arquivo com as configura��es para conex�o','CONEX�O',MB_ICONWARNING);


      //salva um arquivo com as conf de conexao
    except
      Application.MessageBox('N�o foi poss�vel conectar ao banco de dados informado','CONECTAR',MB_ICONERROR);
    end;

  end;
end;

procedure TConexaoFrm.actFecharExecute(Sender: TObject);
begin
  Close;
end;

function TConexaoFrm.confirmar: boolean;
var
  msg : string;
  ok : boolean;
begin
  ok  := True;
  msg := 'Verifique os campos abaixo: '+#13+#13;

  if (edtHost.Text = '') then
  begin
    msg := msg + 'Informe o host (localhost).'+#13;
    ok  := False;
  end;
  if (edtLogin.Text = '') then
  begin
    msg := msg + 'Informe o login (root).'+#13;
    ok  := False;
  end;
  if (edtSenha.Text = '') then
  begin
    msg := msg + 'Informe a senha (****).'+#13;
    ok  := False;
  end;
  if (edtPorta.Text = '') then
  begin
    msg := msg + 'Informe a porta (3306 por padr�o).'+#13;
    ok  := False;
  end;
  if (edtBD.Text = '') then
  begin
    msg := msg + 'Informe o banco de dados.'+#13;
    ok  := False;
  end;

  if (ok = false) then
    Application.MessageBox(pchar(msg),'CONECTAR',MB_ICONINFORMATION);
  result := ok;
end;

procedure TConexaoFrm.Iniciar;
begin
  edtHost.Text  := ConexaoDtm.Conexao.Params.Values['Server'];
  edtLogin.Text := ConexaoDtm.Conexao.Params.Values['User_name'];
  edtSenha.Text := ConexaoDtm.Conexao.Params.Values['Password'];
  edtBD.Text    := ConexaoDtm.Conexao.Params.Values['Database'];
  edtPorta.Text := ConexaoDtm.Conexao.Params.Values['Port'];
end;

end.
