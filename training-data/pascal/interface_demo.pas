program InterfaceDemo;

{$mode objfpc}

type
  IGreeter = interface
    ['{6F1A2B3C-0000-4000-8000-000000000001}']
    function Greet(const Name: string): string;
  end;

  TPoliteGreeter = class(TInterfacedObject, IGreeter)
    function Greet(const Name: string): string;
  end;

function TPoliteGreeter.Greet(const Name: string): string;
begin
  Result := 'Good day, ' + Name;
end;

var
  g: IGreeter;
begin
  g := TPoliteGreeter.Create;
  WriteLn(g.Greet('Ada'));
end.
