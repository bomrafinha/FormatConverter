unit U_Normalize;

interface

uses System.Classes, System.SysUtils;

type
  INormalize<origin, return> = interface
  ['{626CFE11-B45B-4414-9D4D-8C4B5F82F6DC}']

    function normalizeOrigin(content : String) : origin; Overload;
    function normalizeOrigin(content : origin) : TStringList; Overload;
    function normalizeOrigin(content : TStringList) : String; Overload;

    function normalizeReturn(content : String) : return; Overload;
    function normalizeReturn(content : return) : TStringList; Overload;
    function normalizeReturn(content : TStringList) : String; Overload;

  end;

implementation

end.

