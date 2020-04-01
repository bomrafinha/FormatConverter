unit U_JSON.XML;

interface

uses Xml.XMLDoc, System.JSON, U_Origin.Return, System.Classes, System.SysUtils,
  System.StrUtils, FMX.Forms, XMLIntf, System.Generics.Collections;

type
  TJSONtoXML = class(TInterfacedObject, IOriginToReturn<TJSONObject, TXMLDocument>)
  private
//    function nodeToStringList(nodo : IXMLNode; nivel : Integer = -1) : TStringList; Overload;
    function nodeToStringList(nodo : TJSONArray; nivel : Integer = -1) : TStringList; Overload;
//    function nodeToStringJson(nodo : IXMLNode; atr : String = '') : TStringList;
//    function attributeToStringList(atributos : String) : TStringList;
    function tabular(nivel : integer) : String;
//    function getAtributosStr(nodos : IXMLNodeList) : string;
    function typeText(json : String) : string;

  public
    function stringToString(strContent : String) : String;
    function stringToFile(strContent, filePathResult : String) : Boolean;
    function stringToReturnType(strContent : String) : TXMLDocument;

    function fileToString(filePath : String) : String;
    function fileToFile(filePath : String; filePathResult : String = '') : Boolean;
    function fileToReturnType(filePath : String) : TXMLDocument;

    function originTypeToString(content : TJSONObject) : String;
    function originTypeToFile(content : TJSONObject; filePathResult : String) : Boolean;
    function originTypeToReturnType(content : TJSONObject) : TXMLDocument;

    function normalizeOrigin(content : String) : TJSONObject; Overload;
    function normalizeOrigin(content : TJSONObject) : TStringList; Overload;
    function normalizeOrigin(content : TStringList) : String; Overload;

    function normalizeReturn(content : String) : TXMLDocument; Overload;
    function normalizeReturn(content : TXMLDocument) : TStringList; Overload;
    function normalizeReturn(content : TStringList) : String; Overload;

  end;

implementation

{ TJSONtoXML }

function TJSONtoXML.fileToFile(filePath, filePathResult: String): Boolean;
begin

end;

function TJSONtoXML.fileToReturnType(filePath: String): TXMLDocument;
begin

end;

function TJSONtoXML.fileToString(filePath: String): String;
begin

end;

function TJSONtoXML.nodeToStringList(nodo: TJSONArray; nivel: Integer): TStringList;
var
  listReturn : TStringList;
  I: Integer;
  item : TJSONValue;
  listAux : TStringList;
  nome : string;
  valor : string;
  abertura : string;
  fechamento : string;
  auxiliar : string;

begin
  listAux := TStringList.Create();
  listReturn := TStringList.Create();
  listReturn.Clear;

  for item in nodo do
  begin
    listAux.Clear();
    nome := TJSONPair(item).JsonString.ToString;
    try
      valor := TJSONPair(item).JsonValue.ToString;
    except
      valor := 'node';
    end;
    case ansiIndexStr(typeText(valor), ['text', 'object', 'array', 'node']) of
      0:
      begin
        abertura := tabular(nivel) + nome + ': ';
        fechamento := ',';
      end;
      1:
      begin
        if pos('[', valor) = 1 then
        begin
          abertura := tabular(nivel) + nome + ': [';
          fechamento := tabular(nivel) + '],';
        end else begin
          abertura := tabular(nivel) + nome + ': {';
          fechamento := tabular(nivel) + '},';
        end;
        listAux := Self.nodeToStringList(TJSONArray(TJSONObject.ParseJSONValue(valor)) , nivel + 1);
      end;
      2:
      begin
        abertura := tabular(nivel) + nome + ': [';
        fechamento := tabular(nivel) + '],';
        listAux.Delimiter := ',';
        listAux.DelimitedText := valor;

        for I := 0 to listAux.Count - 1 do
        begin
          auxiliar := listAux.Strings[I];
          auxiliar := StringReplace(auxiliar, '[', EmptyStr, [rfReplaceAll]);
          auxiliar := StringReplace(auxiliar, ']', EmptyStr, [rfReplaceAll]);
          auxiliar := StringReplace(auxiliar, '"', EmptyStr, [rfReplaceAll]);
          if auxiliar <> emptyStr then
          begin
            listAux.Strings[I] := tabular(nivel + 1) + '"' + auxiliar + '",';
          end;
        end;
        listAux.Delete(listAux.Count - 1);
        listAux.Strings[listAux.Count - 1] := StringReplace(listAux.Strings[listAux.Count - 1], ',', EmptyStr, [rfReplaceAll]);
      end;
      3:
      begin
        abertura := tabular(nivel) + '{';
        fechamento := tabular(nivel) + '},';
        listAux := Self.nodeToStringList(TJSONArray(item) , nivel + 1);
      end;

    end;
    if listAux.Count <= 0 then
    begin
      listReturn.Add(abertura + valor + fechamento);
    end else begin
      listReturn.Add(abertura);
      for I := 0 to listAux.Count -1 do
      begin
        listReturn.Add(listAux.Strings[I]);
      end;
      listReturn.Add(fechamento);
    end;
  end;

  listReturn.Strings[listReturn.Count - 1] := StringReplace(listReturn.Strings[listReturn.Count - 1], ',', EmptyStr, [rfReplaceAll]);

  Result := listReturn;

end;

function TJSONtoXML.normalizeOrigin(content: TStringList): String;
var
  I: Integer;
  strReturn : String;

begin
  try
    strReturn := EmptyStr;
    for I := 0 to content.Count - 1 do
    begin
      strReturn := strReturn + trim(content.Strings[I]);
    end;
    strReturn := StringReplace(strReturn, ',}', '}', [rfReplaceAll]);
    strReturn := StringReplace(strReturn, ',]', ']', [rfReplaceAll]);
    Result := strReturn;

  except
    Result := EmptyStr;

  end;

end;

function TJSONtoXML.normalizeOrigin(content: TJSONObject): TStringList;
var
  nodo : TJSONArray;
  returnList : TStringList;

begin
  nodo := TJSONArray(content);
  returnList := Self.nodeToStringList(nodo, 0);
  returnList.Insert(0, '{');
  returnList.Add('}');

  Result := returnList;

end;

function TJSONtoXML.normalizeOrigin(content: String): TJSONObject;
var
  jsonReturn : TJSONObject;

begin
  try
    jsonReturn := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(content), 0) as TJSONObject;
    Result := jsonReturn;
  except
    Result := TJSONObject.Create();

  end;

end;

function TJSONtoXML.normalizeReturn(content: String): TXMLDocument;
begin

end;

function TJSONtoXML.normalizeReturn(content: TXMLDocument): TStringList;
begin

end;

function TJSONtoXML.normalizeReturn(content: TStringList): String;
begin

end;

function TJSONtoXML.originTypeToFile(content: TJSONObject;
  filePathResult: String): Boolean;
begin

end;

function TJSONtoXML.originTypeToReturnType(content: TJSONObject): TXMLDocument;
begin

end;

function TJSONtoXML.originTypeToString(content: TJSONObject): String;
begin

end;

function TJSONtoXML.stringToFile(strContent, filePathResult: String): Boolean;
begin

end;

function TJSONtoXML.stringToReturnType(strContent: String): TXMLDocument;
begin

end;

function TJSONtoXML.stringToString(strContent: String): String;
begin

end;

function TJSONtoXML.tabular(nivel: integer): String;
var
  I : Integer;

begin
  Result := EmptyStr;
  for I := 0 to nivel do
  begin
    Result := Result + #32#32;
  end;

end;

function TJSONtoXML.typeText(json: String): string;
begin
  if json = 'node' then
  begin
    Result := json;
  end else if pos('[{', json) = 1 then
  begin
    Result := 'object';
  end else if pos('[', json) = 1 then
  begin
    Result := 'array';
  end else if pos('{', json) > 0 then
  begin
    Result := 'object';
  end else begin
    Result := 'text';
  end;

end;

end.
