unit U_FormatConverter;

interface

uses
  System.Classes, DesignIntf, DesignEditors,
  U_JSON.XML, U_XML.JSON;

type
  TFormatConverter = class(TComponent)
  private
    fJSONtoXML : TJSONtoXML;
    fXMLtoJSON : TXMLtoJSON;
  public
    constructor Create(AOwner: TComponent); override;
    property JSONtoXML : TJSONtoXML read fJSONtoXML write fJSONtoXML;
    property XMLtoJSON : TXMLtoJSON read fXMLtoJSON write fXMLtoJSON;

  end;


procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Ridge Dynamics', [TFormatConverter]);

end;

{ TFormatConverter }

constructor TFormatConverter.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fJSONtoXML := TJSONtoXML.Create();
  fXMLtoJSON := TXMLtoJSON.Create();

end;

end.
