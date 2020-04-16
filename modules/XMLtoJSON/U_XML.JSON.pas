unit U_XML.JSON;

interface

uses Xml.XMLDoc, System.JSON, U_Origin.Return, System.Classes, System.SysUtils,
  System.StrUtils, FMX.Forms, XMLIntf, System.Generics.Collections, U_Normalize;

type
  TXMLtoJSON = class(
    TInterfacedObject,
    IOriginToReturn<TXMLDocument, TJSONObject>,
    INormalize<TXMLDocument, TJSONObject>
  )
  private
    function nodeToStringList(nodo : IXMLNode; nivel : Integer = -1) : TStringList; Overload;
    function nodeToStringList(nodo : TJSONArray; nivel : Integer = -1) : TStringList; Overload;
    function nodeToStringJson(nodo : IXMLNode; atr : String = '') : TStringList;
    function attributeToStringList(atributos : String) : TStringList;
    function tabular(nivel : integer) : String;
    function getAtributosStr(nodos : IXMLNodeList) : string;
    function typeText(json : String) : string;

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

function TXMLtoJSON.attributeToStringList(atributos: String): TStringList;
var
  listAux01 : TStringList;
  listAux02 : TStringList;
  listreturn : TStringList;
  I: Integer;

begin
  listAux01 := TStringList.Create();
  listAux02 := TStringList.Create();
  listReturn := TStringList.Create();

  listAux01.Clear;
  listreturn.Clear;

  listAux01.Delimiter := ' ';
  listAux01.DelimitedText := atributos;

  for I := 0 to listAux01.Count - 1 do
  begin
    listAux02.Clear;
    listAux02.Delimiter := '=';
    listAux02.DelimitedText := listAux01.Strings[I];
    listreturn.Add('"-' + listAux02[0] + '":"' + listAux02[1] + '",');
  end;

  listAux01.Free;
  listAux02.Free;

  Result := listreturn;

end;

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
      1:
      begin
        if Pos('<', listaAux.Strings[0]) > 1 then
        begin
          retorno.Add(abertura);
          retorno.Add(listaAux.Strings[0]);
          retorno.Add(fechamento);
        end else begin
          retorno.Add(abertura + listaAux.Strings[0] + Trim(fechamento));
        end;
      end

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

function TXMLtoJSON.nodeToStringJson(nodo: IXMLNode; atr : String): TStringList;
var
  nome : String;
  atributos : TStringList;
  abertura : string;
  fechamento : string;
  I : Integer;
  J : Integer;
  retorno : TStringList;
  listaAux : TStringList;
  comparador : String;
  arrays : TStringList;
  flag_01 : boolean;

begin
  retorno := TStringList.Create();
  listaAux := TStringList.Create();
  arrays := TStringList.Create();
  arrays.Clear;
  comparador := EmptyStr;
  flag_01 := True;

  for I := 0 to nodo.ChildNodes.Count - 1 do
  begin
    if ((comparador = nodo.ChildNodes[I].NodeName) and (arrays.IndexOf(comparador) = -1)) then
    begin
      arrays.Add(comparador);
    end;
    comparador := nodo.ChildNodes[I].NodeName;
  end;

  for I := 0 to nodo.ChildNodes.Count - 1 do
  begin
    listaAux.Clear;
    nome := nodo.ChildNodes[I].NodeName;
    atributos := attributeToStringList(
      getAtributosStr(
        nodo.ChildNodes[I].AttributeNodes
      )
    );
    abertura := '"' + nome + '":';
    fechamento := ',';

    if not nodo.IsTextElement then
    begin
      listaAux := Self.nodeToStringJson(
        nodo.ChildNodes[I]
      );
    end;

    if arrays.IndexOf(nodo.ChildNodes[I].NodeName) <> -1 then
    begin
      if flag_01 then
      begin
        retorno.Add('"' + nodo.ChildNodes[I].NodeName + '": [' );
        flag_01 := False;
      end;
      abertura := EmptyStr;
    end else begin
      if not flag_01 then
      begin
        retorno.Add('],');
        flag_01 := True;
      end;
    end;

    case listaAux.Count of
      0: retorno.Add('"' + Trim(nodo.ChildNodes[I].NodeValue) + '"');
      1:
      begin
        if (pos('":', listaAux.Strings[0]) > 0) or (atributos.Count > 0) then
        begin
          abertura := abertura + '{';
          fechamento := '}' + fechamento;
          retorno.Add(abertura);
          for J := 0 to atributos.Count - 1 do
          begin
            retorno.Add(atributos.Strings[J]);
          end;
          if pos(':', listaAux.Strings[0]) <= 0 then
          begin
            retorno.Add('"#text":' + listaAux.Strings[0]);
          end else begin
            retorno.Add(listaAux.Strings[0]);
          end;
          retorno.Add(fechamento);
        end else begin
          retorno.Add(abertura + listaAux.Strings[0] + fechamento);
        end;
      end
    else
      abertura := abertura + '{';
      fechamento := '}' + fechamento;
      retorno.Add(abertura);
      for J := 0 to atributos.Count - 1 do
      begin
        retorno.Add(atributos.Strings[J]);
      end;
      for J := 0 to listaAux.Count - 1 do
      begin
        retorno.Add(listaAux.Strings[J]);
      end;
      retorno.Add(fechamento);
    end;

    if (I = nodo.ChildNodes.Count - 1) and not flag_01 then
    begin
      retorno.add('],');
    end;
  end;

  result := retorno;

end;

function TXMLtoJSON.nodeToStringList(nodo: TJSONArray; nivel: Integer): TStringList;
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
  nodo : TJSONArray;
  returnList : TStringList;

begin
  nodo := TJSONArray(content);
  returnList := Self.nodeToStringList(nodo, 0);
  returnList.Insert(0, '{');
  returnList.Add('}');

  Result := returnList;

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
      strReturn := strReturn + trim(content.Strings[I]);
    end;
    strReturn := StringReplace(strReturn, ',}', '}', [rfReplaceAll]);
    strReturn := StringReplace(strReturn, ',]', ']', [rfReplaceAll]);
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
var
  nodo : IXMLNode;
  str : String;
  json : TJSONObject;

begin
  nodo := content.Node;

  str := '{' + Self.normalizeReturn(
    Self.nodeToStringJson(nodo)
  ) + '}';

  str := StringReplace(str, ',}', '}', [rfReplaceAll]);
  str := StringReplace(str, ',]', ']', [rfReplaceAll]);

  json := Self.normalizeReturn(str);

  Result := json;

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

function TXMLtoJSON.typeText(json: String): String;
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
