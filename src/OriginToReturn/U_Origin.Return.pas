unit U_Origin.Return;

interface

type
  IOriginToReturn<origin, return> = interface
    ['{EFCFEF7F-3975-4C6E-8187-D3325B6D7D3C}']

    function stringToString(strContent : String) : String;
    function stringToFile(strContent : String) : Boolean;
    function stringToReturnType(strContent : String) : return;

    function fileToString(filePath : String) : String;
    function fileToFile(filePath : String) : Boolean;
    function fileToReturnType(filePath : String) : return;

    function originTypeToString(content : origin) : String;
    function originTypeToFile(content : origin) : Boolean;
    function originTypeToReturnType(content : origin) : return;

    function normalize(content : String) : origin; Overload;
    function normalize(content : origin) : origin; Overload;
    function normalizeStr(content : String) : String; Overload;
    function normalizeStr(content : origin) : String; Overload;

  end;

implementation

end.

