program ClassInheritanceEx;
{$mode objfpc}
type
  TAnimal = class
    function Speak: string; virtual;
  end;
  TDog = class(TAnimal)
    function Speak: string; override;
  end;

function TAnimal.Speak: string; begin Result := '...'; end;
function TDog.Speak: string; begin Result := 'Woof'; end;

var A: TAnimal;
begin
  A := TDog.Create;
  WriteLn(A.Speak);
  A.Free;
end.
