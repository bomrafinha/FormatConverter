unit U_FormatConverter.View;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Effects, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo,
  FMX.StdCtrls, U_XML.JSON, Xml.XMLDoc, System.JSON, U_JSON.XML, Xml.xmldom,
  Xml.XmlTransform, Xml.XMLIntf;

type
  TFormatConverter = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Layout8: TLayout;
    Layout9: TLayout;
    Layout10: TLayout;
    textoTitulo: TText;
    textoOrigem: TText;
    textoResultado: TText;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    ShadowEffect3: TShadowEffect;
    memoOriginal: TMemo;
    memoResultado: TMemo;
    Layout11: TLayout;
    Layout12: TLayout;
    Layout13: TLayout;
    Layout14: TLayout;
    Layout15: TLayout;
    Layout16: TLayout;
    Layout17: TLayout;
    bJSONtoCSV: TButton;
    bJSONtoXML: TButton;
    bXMLtoCSV: TButton;
    bXMLtoJSON: TButton;
    bCSVtoXML: TButton;
    bCSVtoJSON: TButton;
    procedure FormShow(Sender: TObject);
    procedure bXMLtoJSONClick(Sender: TObject);
    procedure bCSVtoJSONClick(Sender: TObject);
    procedure bCSVtoXMLClick(Sender: TObject);
    procedure bJSONtoCSVClick(Sender: TObject);
    procedure bJSONtoXMLClick(Sender: TObject);
    procedure bXMLtoCSVClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    var
      XMLtoJSON : TXMLtoJSON;
      JSONtoXML : TJSONtoXML;
    procedure convertTest();

  public
    { Public declarations }
  end;

var
  FormatConverter: TFormatConverter;

implementation

{$R *.fmx}

procedure TFormatConverter.bCSVtoJSONClick(Sender: TObject);
begin
  convertTest();

end;

procedure TFormatConverter.bCSVtoXMLClick(Sender: TObject);
begin
  convertTest();

end;

procedure TFormatConverter.bJSONtoCSVClick(Sender: TObject);
begin
  convertTest();

end;

procedure TFormatConverter.bJSONtoXMLClick(Sender: TObject);
var
  xml : TXMLDocument;
  list : TStringList;
  json : TJSONObject;

begin
  json := JSONtoXML.normalizeOrigin(memoOriginal.Text);
  list := JSONtoXML.normalizeOrigin(json);
  memoOriginal.Lines.Clear;
  memoOriginal.Lines := list;

  xml := JSONtoXML.originTypeToReturnType(json);

  list := JSONtoXML.normalizeReturn(xml);

  memoResultado.Lines.Clear;
  memoResultado.lines := list;

end;

procedure TFormatConverter.bXMLtoCSVClick(Sender: TObject);
var
  Raiz, Nome, NomeAttrib, SobreNome,
  Filiacao, Pai, Mae,
  Endereco, Rua, Bairro, Municipio,
  UF, CEP,
  Ver, PowerBy: IXMLNode;
  XMLDocument1 : TXMLDocument;

begin
  XMLDocument1 := TXMLDocument.Create(nil);
  XMLDocument1.FileName := '';
  XMLDocument1.XML.Text := '';
  XMLDocument1.Active := False;
  XMLDocument1.XML.Clear;
  XMLDocument1.Options := [doNodeAutoIndent];
  XMLDocument1.Active := True;
  XMLDocument1.Version := '1.0';
  XMLDocument1.Encoding := 'UTF-8';

  // RAIZ
  Raiz := XMLDocument1.AddChild('RAIZ');

  // POWER BY
  PowerBy := XMLDocument1.CreateNode('POWER_BY', ntAttribute);
  PowerBy.Text := 'Johnny Walker';
  Raiz.AttributeNodes.Add(PowerBy);

  // VERSÃO
  Ver     := XMLDocument1.CreateNode('VERSION', ntAttribute);
  Ver.Text := '1.0';
  Raiz.AttributeNodes.Add(ver);

  // NOME
  Nome := XMLDocument1.CreateNode('NOME', ntElement);
  Raiz.ChildNodes.Add(Nome);

  // NOME ATRIBUTO
  NomeAttrib := XMLDocument1.CreateNode('NOME', ntAttribute);
  NomeAttrib.Text := 'Johnny Walker Junior';
  Nome.AttributeNodes.Add(NomeAttrib);

  SobreNome := XMLDocument1.CreateNode('SOBRENOME', ntAttribute);
  SobreNome.Text := 'Walker';
  Nome.AttributeNodes.Add(SobreNome);

  // FILIACAO
  Filiacao := XMLDocument1.CreateNode('FILIACAO', ntElement);
  Nome.ChildNodes.Add(Filiacao);

  // FILIACAO PAI
  Pai := XMLDocument1.CreateNode('PAI', ntElement);
  Nome := XMLDocument1.CreateNode('NOME', ntElement);
  Nome.Text := 'Fulano de Tal júnior';
  Pai.ChildNodes.Add(Nome);
  Filiacao.ChildNodes.Add(Pai);

  // FILIACAO MAE
  Mae := XMLDocument1.CreateNode('MAE', ntElement);
  Nome := XMLDocument1.CreateNode('NOME', ntElement);
  Nome.Text := 'Fulaninha de Tal da Silva';
  SobreNome := XMLDocument1.CreateNode('SOBRENOME', ntElement);
  SobreNome.Text := 'Fulaninha de Tal da Silva';
  Mae.ChildNodes.Add(Nome);
  Mae.ChildNodes.Add(SobreNome);
  Filiacao.ChildNodes.Add(Mae);

  //XMLDocument1.CreateElement('Johnny_Walker', '');
  Endereco := XMLDocument1.CreateNode('ENDERECO', ntElement);
  Raiz.ChildNodes.Add(Endereco);

  Rua := XMLDocument1.CreateNode('RUA', ntAttribute);
  Rua.Text := 'Rio Letes, 666';
  Endereco.AttributeNodes.Add(Rua);

  Bairro := XMLDocument1.CreateNode('BAIRRO', ntAttribute);
  Bairro.Text := 'Fiat Aquae ';
  Endereco.AttributeNodes.Add(Bairro);

  Municipio := XMLDocument1.CreateNode('MUNICIPIO', ntAttribute);
  Municipio.Text := 'Contagem';
  Endereco.AttributeNodes.Add(Municipio);

  UF := XMLDocument1.CreateNode('UF', ntAttribute);
  UF.Text := 'MG';
  Endereco.AttributeNodes.Add(UF);

  CEP := XMLDocument1.CreateNode('CEP', ntAttribute);
  CEP.Text := '32.999-999';
  Endereco.AttributeNodes.Add(CEP);
  XMLDocument1.SaveToFile('D:\Users\Bomrafinha\Desktop\rafa.xml');
  XMLDocument1.Active := False;





//  convertTest();

end;

procedure TFormatConverter.bXMLtoJSONClick(Sender: TObject);
var
  xml : TXMLDocument;
  list : TStringList;
  json : TJSONObject;

begin
  xml := XMLtoJSON.normalizeOrigin(memoOriginal.Text);
  list := XMLtoJSON.normalizeOrigin(xml);
  memoOriginal.Lines.Clear;
  memoOriginal.Lines := list;

  json := XMLtoJSON.originTypeToReturnType(xml);

  list := XMLtoJSON.normalizeReturn(json);
  memoResultado.Lines.Clear;
  memoResultado.lines := list;

end;

procedure TFormatConverter.convertTest;
begin
  memoResultado.Text := memoOriginal.Text;

end;

procedure TFormatConverter.FormCreate(Sender: TObject);
begin
  XMLtoJSON := TXMLtoJSON.Create();

end;

procedure TFormatConverter.FormShow(Sender: TObject);
var
  ScreenSize: TSize;
  blocosConteudoWitdth : Integer;
  blocosBotoesWitdth : Integer;

begin
  ScreenSize := Screen.Size;

  Self.Width := trunc(ScreenSize.Width * 0.8);
  Self.Height := trunc(ScreenSize.Height * 0.8);

  blocosBotoesWitdth := trunc(Self.ClientWidth * 0.15);
  blocosConteudoWitdth := trunc(Self.Layout3.Width / 2) - 10;

  Self.Layout2.Width := blocosBotoesWitdth;
  Self.Layout5.Width := blocosConteudoWitdth;
  Self.Layout7.Width := blocosConteudoWitdth;

  memoOriginal.Lines.Clear;
  memoResultado.Lines.Clear;

end;

end.
