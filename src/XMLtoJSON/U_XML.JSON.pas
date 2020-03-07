unit U_XML.JSON;

interface

uses Xml.XMLDoc, System.JSON, U_Origin.Return;

type
  TXMLtoJSON = class(TInterfacedObject, IOriginToReturn<TXMLDocument, TJSONObject>)
  public
    function stringToString(strContent : String) : String;
    function stringToFile(strContent : String) : Boolean;
    function stringToReturnType(strContent : String) : TJSONObject;

    function fileToString(filePath : String) : String;
    function fileToFile(filePath : String) : Boolean;
    function fileToReturnType(filePath : String) : TJSONObject;

    function originTypeToString(content : TXMLDocument) : String;
    function originTypeToFile(content : TXMLDocument) : Boolean;
    function originTypeToReturnType(content : TXMLDocument) : TJSONObject;

    function normalize(content : String) : TXMLDocument; Overload;
    function normalize(content : TXMLDocument) : TXMLDocument; Overload;
    function normalizeStr(content : String) : String; Overload;
    function normalizeStr(content : TXMLDocument) : String; Overload;

  end;


implementation

{ TXMLtoJSON }

function TXMLtoJSON.fileToFile(filePath: String): Boolean;
begin

end;

function TXMLtoJSON.fileToReturnType(filePath: String): TJSONObject;
begin

end;

function TXMLtoJSON.fileToString(filePath: String): String;
begin

end;

function TXMLtoJSON.normalize(content: String): TXMLDocument;
begin

end;

function TXMLtoJSON.normalize(content: TXMLDocument): TXMLDocument;
begin

end;

function TXMLtoJSON.normalizeStr(content: String): String;
begin

end;

function TXMLtoJSON.normalizeStr(content: TXMLDocument): String;
begin

end;

function TXMLtoJSON.originTypeToFile(content: TXMLDocument): Boolean;
begin

end;

function TXMLtoJSON.originTypeToReturnType(content: TXMLDocument): TJSONObject;
begin

end;

function TXMLtoJSON.originTypeToString(content: TXMLDocument): String;
begin

end;

function TXMLtoJSON.stringToFile(strContent: String): Boolean;
begin

end;

function TXMLtoJSON.stringToReturnType(strContent: String): TJSONObject;
begin

end;

function TXMLtoJSON.stringToString(strContent: String): String;
begin

end;

end.
