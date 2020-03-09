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
  try try    
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
  try try 
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
  try try   
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
  
  finally
    arquivo.Free;
  end;  

end;

function TXMLtoJSON.normalizeOrigin(content: String): TXMLDocument;
begin

end;

function TXMLtoJSON.normalizeOrigin(content: TXMLDocument): TStringList;
begin

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
      strReturn := strReturn + content.Strings[I];  
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
  jsonReturn := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(content), 0) as TJSONObject;
  Result := jsonReturn;

end;

function TXMLtoJSON.normalizeReturn(content: TJSONObject): TStringList;
begin

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

end.
