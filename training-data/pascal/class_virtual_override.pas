program Poly;
{$mode objfpc}
type
  TAnimal = class function Speak: string; virtual; end;
  TDog = class(TAnimal) function Speak: string; override; end;
function TAnimal.Speak: string; begin Result := '...' end;
function TDog.Speak: string; begin Result := 'Woof' end;
var a: TAnimal;
begin
  a := TDog.Create;
  writeln(a.Speak);
  a.Free;
end.
