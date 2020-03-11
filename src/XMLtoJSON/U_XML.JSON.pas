unit U_XML.JSON;

interface

uses Xml.XMLDoc, System.JSON, U_Origin.Return, System.Classes, System.SysUtils,
  FMX.Forms, XMLIntf;

type
  TXMLtoJSON = class(TInterfacedObject, IOriginToReturn<TXMLDocument, TJSONObject>)
  private
    function nodeToStringList(nodo : IXMLNode; nivel : Integer = -1) : TStringList;
    function tabular(nivel : integer) : String;
    function getAtributosStr(nodos : IXMLNodeList) : string;

  public
    function stringToString(strContent : String) : String; // Testar
    function stringToFile(strContent, filePathResult : String) : Boolean; // Testar
    function stringToReturnType(strContent : String) : TJSONObject; // Testar

    function fileToString(filePath : String) : String; // Testar
    function fileToFile(filePath : String; filePathResult : String = '') : Boolean; // Testar
    function fileToReturnType(filePath : String) : TJSONObject; // Testar

    function originTypeToString(content : TXMLDocument) : String; // Testar
    function originTypeToFile(content : TXMLDocument; filePathResult : String) : Boolean; // Testar
    function originTypeToReturnType(content : TXMLDocument) : TJSONObject; //Implementar

    function normalizeOrigin(content : String) : TXMLDocument; Overload;
    function normalizeOrigin(content : TXMLDocument) : TStringList; Overload; // Testar
    function normalizeOrigin(content : TStringList) : String; Overload;

    function normalizeReturn(content : String) : TJSONObject; Overload; // Testar
    function normalizeReturn(content : TJSONObject) : TStringList; Overload; // Testar
    function normalizeReturn(content : TStringList) : String; Overload; // Testar

  end;     

implementation

{ TXMLtoJSON }

function TXMLtoJSON.fileToFile(filePath: String; filePathResult : String = ''): Boolean;
var
  arquivo : TStringList;
  strContent : String;
  xmlContent : TXMLDocument;
  jsonReturn : TJSONObject;
  
begin    
  arquivo := TStringList.Create();      
  try try    
    Result := True;
    if filePathResult = EmptyStr then
    begin
      filePathResult := StringReplace(filePath, '.xml', '.json', [rfIgnoreCase]);
    end;
    arquivo.Clear();
    arquivo.LoadFromFile(filePath);
    strContent := self.normalizeOrigin(arquivo);
    xmlContent := self.normalizeOrigin(strContent);
    jsonReturn := self.originTypeToReturnType(xmlContent);    
    arquivo.Clear();
    arquivo := self.normalizeReturn(jsonReturn);
    arquivo.SaveToFile(filePathResult);
    if not FileExists(filePathResult) then
    begin
      raise Exception.Create('Arquivo de retorno não foi gerado.');
    end;                                                               
    
  except
    Result := False;  
    
  end;
  
  finally
    arquivo.Free;
  end;  

end;

function TXMLtoJSON.fileToReturnType(filePath: String): TJSONObject;
var
  arquivo : TStringList;
  strContent : String;
  xmlContent : TXMLDocument;
  jsonReturn : TJSONObject;
  
begin     
  arquivo := TStringList.Create();     
  try try 
    arquivo.Clear();
    arquivo.LoadFromFile(filePath);
    strContent := self.normalizeOrigin(arquivo);
    xmlContent := self.normalizeOrigin(strContent);
    jsonReturn := self.originTypeToReturnType(xmlContent);  

    Result := jsonReturn;                          
    
  except
    Result := TJSONObject.Create();
    
  end;    
  
  finally
    arquivo.Free;
  end;  

end;

function TXMLtoJSON.fileToString(filePath: String): String;
var
  arquivo : TStringList;
  strContent : String;
  xmlContent : TXMLDocument;
  jsonReturn : TJSONObject;
  strReturn : String;
  
begin    
  arquivo := TStringList.Create();      
  try try   
    Result := EmptyStr;
    arquivo.Clear();
    arquivo.LoadFromFile(filePath);
    strContent := self.normalizeOrigin(arquivo);
    xmlContent := self.normalizeOrigin(strContent);
    jsonReturn := self.originTypeToReturnType(xmlContent);    
    arquivo.Clear();
    arquivo := self.normalizeReturn(jsonReturn);
    strReturn := self.normalizeReturn(arquivo);

    Result := strReturn;                          
    
  except
    Result := EmptyStr;
    
  end;   
  
  finally
    arquivo.Free;
  end;  

end;

function TXMLtoJSON.normalizeOrigin(content: String): TXMLDocument;
var
  xmlReturn : TXMLDocument;
  
begin                 
  try     
    xmlReturn := TXMLDocument.Create(Application);
    xmlReturn.LoadFromXML(content);
    Result := xmlReturn;
  except                                          
    Result := TXMLDocument.Create(Application);    

  end;

end;

function TXMLtoJSON.normalizeOrigin(content: TXMLDocument): TStringList;
var
  nodo : IXMLNode;

begin
  nodo := content.Node;
  Result := Self.nodeToStringList(nodo);

end;

function TXMLtoJSON.nodeToStringList(nodo: IXMLNode; nivel : Integer): TStringList;
var
  nome : String;
  atributos : string;
  abertura : string;
  fechamento : string;
  I : Integer;
  J : Integer;
  retorno : TStringList;
  listaAux : TStringList;

begin
  retorno := TStringList.Create();
  listaAux := TStringList.Create();
  retorno.Clear;

  for I := 0 to nodo.ChildNodes.Count - 1 do
  begin
    listaAux.Clear;
    nome := nodo.ChildNodes[I].NodeName;
    atributos := getAtributosStr(nodo.ChildNodes[I].AttributeNodes);
    abertura := tabular(nivel) + '<' + nome + atributos + '>';
    fechamento := tabular(nivel) + '</' + nome + '>';

    if not nodo.IsTextElement then
    begin
      listaAux := Self.nodeToStringList(nodo.ChildNodes[I], nivel + 1);
    end;

    case listaAux.Count of
      0: retorno.Add(Trim(nodo.ChildNodes[I].NodeValue));
      1: retorno.Add(abertura + listaAux.Strings[0] + Trim(fechamento));

    else
      retorno.Add(abertura);
      for J := 0 to listaAux.Count - 1 do
      begin
        retorno.Add(listaAux.Strings[J]);
      end;
      retorno.Add(fechamento);
    end;
  end;

  result := retorno;

end;

function TXMLtoJSON.normalizeOrigin(content: TStringList): String;
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
    Result := strReturn;
    
  except
    Result := EmptyStr;
    
  end;                 

end;

function TXMLtoJSON.normalizeReturn(content: String): TJSONObject;
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

function TXMLtoJSON.normalizeReturn(content: TJSONObject): TStringList;
var
  listReturn : TStringList;
  arrayJson : TJSONArray;
  I: Integer;
  
begin                      
  listReturn := TStringList.Create();
  listReturn.Clear;
                           
  arrayJson := TJSONArray(content);

  for I := 0 to arrayJson.Count - 1 do
  begin
    listReturn.Add(arrayJson.Items[I].Value);  
  end;

  Result := listReturn;  

end;      

function TXMLtoJSON.normalizeReturn(content: TStringList): String;
var
  I: Integer;
  strReturn : String;
  
begin
  try
    strReturn := EmptyStr;
    for I := 0 to content.Count - 1 do
    begin
      strReturn := strReturn + content.Strings[I];  
    end;
    Result := strReturn;
    
  except
    Result := EmptyStr;
    
  end;                 


end;

function TXMLtoJSON.originTypeToFile(content: TXMLDocument; filePathResult : String): Boolean;
var
  arquivo : TStringList;
  jsonReturn : TJSONObject;
  
begin          
  try try    
    Result := True;
    arquivo := TStringList.Create();
    arquivo.Clear();
    
    jsonReturn := self.originTypeToReturnType(content);   
    arquivo := self.normalizeReturn(jsonReturn);
    arquivo.SaveToFile(filePathResult);
    if not FileExists(filePathResult) then
    begin
      raise Exception.Create('Arquivo de retorno não foi gerado.');
    end;                                                               
    
  except
    Result := False;    
    
  end;     
  
  finally
    arquivo.Free;
  end;  

end;

function TXMLtoJSON.originTypeToReturnType(content: TXMLDocument): TJSONObject;
begin

end;

function TXMLtoJSON.originTypeToString(content: TXMLDocument): String;
var
  jsonReturn : TJSONObject;
  arquivo : TStringList;
  strReturn : String;
  
begin          
  try try    
    Result := EmptyStr;
    arquivo := TStringList.Create();
    arquivo.Clear();
    
    jsonReturn := self.originTypeToReturnType(content); 
    arquivo := self.normalizeReturn(jsonReturn);
    strReturn := self.normalizeReturn(arquivo);

    Result := strReturn;                        
    
  except
    Result := EmptyStr;
    
  end;   
  
  finally
    arquivo.Free;
  end;  

end;

function TXMLtoJSON.getAtributosStr(nodos: IXMLNodeList): string;
var
  I: Integer;
  strReturn: string;

begin
  strReturn := EmptyStr;

  for I := 0 to nodos.Count - 1 do
  begin
    strReturn := strReturn + nodos[I].XML + #32;
  end;

  if strReturn <> EmptyStr then
  begin
    strReturn := #32 + Trim(strReturn);
  end;

  Result := strReturn;

end;

function TXMLtoJSON.stringToFile(strContent, filePathResult: String): Boolean;
var
  arquivo : TStringList;
  xmlContent : TXMLDocument;
  jsonReturn : TJSONObject;
  
begin          
  try try   
    Result := True;
    arquivo := TStringList.Create();
    arquivo.Clear();
    
    xmlContent := self.normalizeOrigin(strContent);
    jsonReturn := self.originTypeToReturnType(xmlContent); 
    arquivo := self.normalizeReturn(jsonReturn);
    arquivo.SaveToFile(filePathResult);
    if not FileExists(filePathResult) then
    begin
      raise Exception.Create('Arquivo de retorno não foi gerado.');
    end;                                                               
    
  except
    Result := False;    
    
  end;          
  
  finally
    arquivo.Free;
  end;  

end;

function TXMLtoJSON.stringToReturnType(strContent: String): TJSONObject;
var
  xmlContent : TXMLDocument;
  jsonReturn : TJSONObject;
  arquivo : TStringList;
  strReturn : String;
  
begin          
  try try
    xmlContent := self.normalizeOrigin(strContent);
    jsonReturn := self.originTypeToReturnType(xmlContent); 

    Result := jsonReturn;                        
    
  except
    Result := TJSONObject.Create();
    
  end;  
  
  finally
    arquivo.Free;
  end;  

end;

function TXMLtoJSON.stringToString(strContent: String): String;
var
  xmlContent : TXMLDocument;
  jsonReturn : TJSONObject;
  arquivo : TStringList;
  strReturn : String;
  
begin          
  try try    
    Result := EmptyStr;
    arquivo := TStringList.Create();
    arquivo.Clear();
    
    xmlContent := self.normalizeOrigin(strContent);
    jsonReturn := self.originTypeToReturnType(xmlContent); 
    arquivo := self.normalizeReturn(jsonReturn);
    strReturn := self.normalizeReturn(arquivo);

    Result := strReturn;                        
    
  except
    Result := EmptyStr;
    
  end;  
  
  finally
    arquivo.Free;
  end;  

end;

function TXMLtoJSON.tabular(nivel: integer): String;
var
  I : Integer;
  
begin
  Result := EmptyStr;  
  for I := 0 to nivel do
  begin
    Result := Result + #32#32;
  end;
    
end;

end.
