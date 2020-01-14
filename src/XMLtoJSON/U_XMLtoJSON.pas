unit U_XMLtoJSON;

interface

uses Xml.XMLDoc, System.JSON;

type
  TXMLtoJSON = class(TInterfacedObject)
  public
    function getJSONfromXML_StringToString(XML : String) : String;
    function getJSONfromXML_StringToTJSONObject(XML : String) : TJSONObject;
    function getJSONfromXML_StringToFile(XML, caminho : String) : Boolean;
    function getJSONfromXML_TXMLDocumentToString(XML : TXMLDocument) : String;
    function getJSONfromXML_TXMLDocumentToTJSONObject(XML : TXMLDocument) : TJSONObject;
    function getJSONfromXML_TXMLDocumentToFile(XML, caminho : String) : Boolean;

    function getJSONfromXML_FileToString(caminho : String) : String;

    function getJSONfromXML_FileTJSONObject(caminho : String) : TJSONObject;

    function getXMLfromJSON_StringToString(JSON : String) : String;
    function getXMLfromJSON_StringToTXMLDocument(JSON : String) : TXMLDocument;
    function getXMLfromJSON_TJSONObjectToString(JSON : TJSONObject) : String;
    function getXMLfromJSON_TJSONObjectToTXMLDocument(JSON : TJSONObject) : TXMLDocument;
    function getXMLfromJSON_FileToString(caminho : String) : String;
    function getXMLfromJSON_FileToTXMLDocument(caminho : String) : TXMLDocument;
  end;


implementation

{ TXMLtoJSON }

end.
