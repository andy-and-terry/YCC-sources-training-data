{$mode objfpc}{$H+}
program ClassIsAsDemo;

type
  TAnimal = class
    function Name: string; virtual;
  end;
  TDog = class(TAnimal)
    function Name: string; override;
    procedure Fetch;
  end;
  TCat = class(TAnimal)
    function Name: string; override;
  end;

function TAnimal.Name: string; begin Result := 'animal'; end;
function TDog.Name: string; begin Result := 'dog'; end;
function TCat.Name: string; begin Result := 'cat'; end;
procedure TDog.Fetch; begin WriteLn('dog fetches'); end;

var
  pets: array[0..2] of TAnimal;
  i: Integer;
begin
  pets[0] := TDog.Create;
  pets[1] := TCat.Create;
  pets[2] := TAnimal.Create;

  for i := 0 to 2 do
  begin
    Write(pets[i].Name, ': ');
    if pets[i] is TDog then
      (pets[i] as TDog).Fetch
    else
      WriteLn('is TAnimal: ', pets[i] is TAnimal, ', class ', pets[i].ClassName);
  end;

  for i := 0 to 2 do pets[i].Free;
end.
