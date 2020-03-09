unit U_Origin.Return;

interface

uses System.Classes;

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

    function normalizeOrigin(content : String) : origin; Overload;
    function normalizeOrigin(content : origin) : TStringList; Overload;
    function normalizeOrigin(content : TStringList) : String; Overload;

    function normalizeReturn(content : String) : return; Overload;
    function normalizeReturn(content : return) : TStringList; Overload;
    function normalizeReturn(content : TStringList) : String; Overload;

  end;

implementation

end.

