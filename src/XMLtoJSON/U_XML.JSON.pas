unit U_XML.JSON;

interface

uses Xml.XMLDoc, System.JSON, U_Origin.Return, System.Classes, SysUtils;

type
  TXMLtoJSON = class(TInterfacedObject, IOriginToReturn<TXMLDocument, TJSONObject>)
  public
    function stringToString(strContent : String) : String;
    function stringToFile(strContent, filePathResult : String) : Boolean;
    function stringToReturnType(strContent : String) : TJSONObject;

    function fileToString(filePath : String) : String;
    function fileToFile(filePath : String; filePathResult : String = '') : Boolean;
    function fileToReturnType(filePath : String) : TJSONObject;

    function originTypeToString(content : TXMLDocument) : String;
    function originTypeToFile(content : TXMLDocument; filePathResult : String) : Boolean;
    function originTypeToReturnType(content : TXMLDocument) : TJSONObject;

    function normalizeOrigin(content : String) : TXMLDocument; Overload;
    function normalizeOrigin(content : TXMLDocument) : TStringList; Overload;
    function normalizeOrigin(content : TStringList) : String; Overload;

    function normalizeReturn(content : String) : TJSONObject; Overload;
    function normalizeReturn(content : TJSONObject) : TStringList; Overload;
    function normalizeReturn(content : TStringList) : String; Overload;

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
  try     
    Result := True;
    if filePathResult = EmptyStr then
    begin
      filePathResult := StringReplace(filePath, '.xml', '.json', [rfIgnoreCase]);
    end;
    arquivo := TStringList.Create();
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

end;

function TXMLtoJSON.fileToReturnType(filePath: String): TJSONObject;
var
  arquivo : TStringList;
  strContent : String;
  xmlContent : TXMLDocument;
  jsonReturn : TJSONObject;
  
begin          
  try     
    arquivo := TStringList.Create();
    arquivo.Clear();
    arquivo.LoadFromFile(filePath);
    strContent := self.normalizeOrigin(arquivo);
    xmlContent := self.normalizeOrigin(strContent);
    jsonReturn := self.originTypeToReturnType(xmlContent);  

    Result := jsonReturn;                          
    
  except
    Result := TJSONObject.Create();
    
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
  try     
    Result := EmptyStr;
    arquivo := TStringList.Create();
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

end;

function TXMLtoJSON.normalizeOrigin(content: String): TXMLDocument;
begin

end;

function TXMLtoJSON.normalizeOrigin(content: TXMLDocument): TStringList;
begin

end;

function TXMLtoJSON.normalizeOrigin(content: TStringList): String;
begin

end;

function TXMLtoJSON.normalizeReturn(content: String): TJSONObject;
begin

end;

function TXMLtoJSON.normalizeReturn(content: TJSONObject): TStringList;
begin

end;

function TXMLtoJSON.normalizeReturn(content: TStringList): String;
begin

end;

function TXMLtoJSON.originTypeToFile(content: TXMLDocument; filePathResult : String): Boolean;
begin

end;

function TXMLtoJSON.originTypeToReturnType(content: TXMLDocument): TJSONObject;
begin

end;

function TXMLtoJSON.originTypeToString(content: TXMLDocument): String;
begin

end;

function TXMLtoJSON.stringToFile(strContent, filePathResult: String): Boolean;
var
  arquivo : TStringList;
  xmlContent : TXMLDocument;
  jsonReturn : TJSONObject;
  
begin          
  try     
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

end;

function TXMLtoJSON.stringToReturnType(strContent: String): TJSONObject;
var
  xmlContent : TXMLDocument;
  jsonReturn : TJSONObject;
  arquivo : TStringList;
  strReturn : String;
  
begin          
  try         
    xmlContent := self.normalizeOrigin(strContent);
    jsonReturn := self.originTypeToReturnType(xmlContent); 

    Result := jsonReturn;                        
    
  except
    Result := TJSONObject.Create();
    
  end;

end;

function TXMLtoJSON.stringToString(strContent: String): String;
var
  xmlContent : TXMLDocument;
  jsonReturn : TJSONObject;
  arquivo : TStringList;
  strReturn : String;
  
begin          
  try     
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

end;

end.
