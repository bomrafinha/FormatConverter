unit U_Origin.Return;

interface

uses System.Classes, System.SysUtils;

type
  IOriginToReturn<origin, return> = interface
    ['{EFCFEF7F-3975-4C6E-8187-D3325B6D7D3C}']

    function stringToString(strContent : String) : String;
    function stringToFile(strContent, filePathResult : String) : Boolean;
    function stringToReturnType(strContent : String) : return;

    function fileToString(filePath : String) : String;
    function fileToFile(filePath : String; filePathResult : String = '') : Boolean;
    function fileToReturnType(filePath : String) : return;

    function originTypeToString(content : origin) : String;
    function originTypeToFile(content : origin; filePathResult : String) : Boolean;
    function originTypeToReturnType(content : origin) : return;

  end;

implementation

end.

