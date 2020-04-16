unit U_FormatConverterTester.View;

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
begin
  convertTest();

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
