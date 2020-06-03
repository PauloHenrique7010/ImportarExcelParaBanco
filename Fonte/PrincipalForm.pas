unit PrincipalForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ActnMan, comobj;

type
  TPrincipalFrm = class(TForm)
    btnFechar: TBitBtn;
    btnConfiguracao: TBitBtn;
    edtCaminhoExcel: TEdit;
    btnPegarExcel: TBitBtn;
    OpenDialog1: TOpenDialog;
    ActionList1: TActionList;
    actFechar: TAction;
    actPegarExcel: TAction;
    actConfiguracoes: TAction;
    grbOpcoes: TGroupBox;
    rdbZerar: TRadioButton;
    rdbAdicionar: TRadioButton;
    actLimparCaminho: TAction;
    btnLimparCaminho: TBitBtn;
    actImportar: TAction;
    btnImportar: TBitBtn;
    procedure actFecharExecute(Sender: TObject);
    procedure actPegarExcelExecute(Sender: TObject);
    procedure actConfiguracoesExecute(Sender: TObject);
    procedure rdbZerarClick(Sender: TObject);
    procedure rdbAdicionarClick(Sender: TObject);
    procedure actLimparCaminhoExecute(Sender: TObject);
    procedure actImportarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    lColunaNome, lColunaTipo : TStringList;
    function importarExcel:boolean;
    procedure carregarColunasBanco;
  public
    { Public declarations }
  end;

var
  PrincipalFrm: TPrincipalFrm;

implementation

{$R *.dfm}

uses ConfiguracoesForm;

procedure TPrincipalFrm.actConfiguracoesExecute(Sender: TObject);
begin
  Application.CreateForm(TConfiguracoesFrm, ConfiguracoesFrm);
  try
    ConfiguracoesFrm.ShowModal;
  finally
    FreeAndNil(ConfiguracoesFrm);
  end;
end;

procedure TPrincipalFrm.actFecharExecute(Sender: TObject);
begin
  Close;
end;

procedure TPrincipalFrm.actImportarExecute(Sender: TObject);
var
  podeImportar  : boolean;
  msgAviso      : string;
begin
  msgAviso      := '';
  podeImportar  := True;

  if (edtCaminhoExcel.Text = '') then
  begin
    msgAviso      := msgAviso + 'Informe o arquivo excel a ser importado';
    podeImportar  := False;
  end;

  if (podeImportar = false) then
    Application.MessageBox(Pchar(msgAviso), 'IMPORTAR', MB_ICONWARNING)
  else
  begin
    if (importarExcel) then
      Application.MessageBox('Arquivos importados!', 'IMPORTAR', MB_ICONINFORMATION);
  end;
end;

procedure TPrincipalFrm.actLimparCaminhoExecute(Sender: TObject);
begin
  edtCaminhoExcel.Clear;
end;

procedure TPrincipalFrm.actPegarExcelExecute(Sender: TObject);
begin
  if (OpenDialog1.Execute) then
  begin
    edtCaminhoExcel.Text := OpenDialog1.FileName;
  end;
end;

procedure TPrincipalFrm.carregarColunasBanco;
var
  arq: TextFile; { declarando a vari�vel "arq" do tipo arquivo texto }
  linha: string;
  caminho : string;
  nomeColuna, tipoColuna : string;
  lista : TStringList;
begin
  caminho := ExtractFileDir(ParamStr(0))+'\colunas.txt';
  lista := Tstringlist.Create;
  AssignFile(arq, caminho);

  {$I-}         // desativa a diretiva de Input
  Reset(arq);   // [ 3 ] Abre o arquivo texto para leitura
  {$I+}         // ativa a diretiva de Input

  if (IOResult <> 0) then
    ShowMessage('n�o foi possivel abrir')
  else
  begin
    while (not eof(arq)) do
    begin
      readln(arq, linha);
      lista.Delimiter := ' ';
      lista.DelimitedText := linha;
      lColunaNome.Add(lista.Strings[0]);
      lColunaTipo.Add(lista.Strings[1]);
    end;

    CloseFile(arq);
  end;
end;

procedure TPrincipalFrm.FormCreate(Sender: TObject);
begin
  lColunaNome := TStringList.Create;
  lColunaTipo := TStringList.Create;
  carregarColunasBanco;
end;

function TPrincipalFrm.importarExcel: boolean;
var
   excel, sheet: OLEVariant;
   x, y, linha, r: Integer;
   nome : string;
begin
  Result := False;
  // Cria Excel- OLE Object
  excel := CreateOleObject('Excel.Application');
  try
    Excel.WorkBooks.Open(OpenDialog1.FileName);
    Excel.Visible := false;
    Sheet := Excel.Workbooks[1].WorkSheets[1];

    // Pegar o n�mero da �ltima linha
    x := excel.ActiveCell.Row;
    // Pegar o n�mero da �ltima coluna
    y := excel.ActiveCell.Column;
    //for linha := 2 to x do
    linha := 2;
    while linha < x do
    begin
      nome := Sheet.Cells[linha, 1].Value;
      linha := linha  + 1;
    end;









      // Seta xStringGrid linha e coluna
      // Associaca a variant WorkSheet com a variant do Delphi
      //RangeMatrix := XLSAplicacao.Range['A1', XLSAplicacao.Cells.Item[x, y]].Value;
      // Cria o loop para listar os registros no TStringGrid
      {k := 1;
      repeat
         for r := 1 to y do
            XStringGrid.Cells[(r - 1), (k - 1)] := RangeMatrix[k, r];
         Inc(k, 1);
      until k > x;
      RangeMatrix := Unassigned; }
   finally
   end;
end; {
begin
  result := False;
  try

  except
    on e:exception do
    begin

    end;

  end;
end;             }

procedure TPrincipalFrm.rdbAdicionarClick(Sender: TObject);
begin
  if (rdbAdicionar.Checked) then
    rdbZerar.Checked := False;
end;

procedure TPrincipalFrm.rdbZerarClick(Sender: TObject);
begin
  if (rdbZerar.Checked) then
    rdbAdicionar.Checked := False;

end;

end.
