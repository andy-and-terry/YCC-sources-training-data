{$mode objfpc}{$H+}
program InterfacesImplementation;

type
  IGreeter = interface
    ['{11111111-2222-3333-4444-555555555555}']
    function Greet(const Name: string): string;
  end;

  TEnglish = class(TInterfacedObject, IGreeter)
    function Greet(const Name: string): string;
  end;

  TFrench = class(TInterfacedObject, IGreeter)
    function Greet(const Name: string): string;
  end;

function TEnglish.Greet(const Name: string): string;
begin Result := 'Hello, ' + Name; end;

function TFrench.Greet(const Name: string): string;
begin Result := 'Bonjour, ' + Name; end;

var
  G: IGreeter;
  List: array of IGreeter;
  I: Integer;
begin
  SetLength(List, 2);
  List[0] := TEnglish.Create;
  List[1] := TFrench.Create;
  for I := 0 to High(List) do WriteLn(List[I].Greet('Ada'));
  G := List[0];
  WriteLn(Supports(G, IGreeter));
end.
