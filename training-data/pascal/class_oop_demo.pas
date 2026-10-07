{$mode objfpc}
program ClassOopDemo;

type
  TAnimal = class
  private
    FName: string;
  public
    constructor Create(name: string);
    function Speak: string; virtual;
    property Name: string read FName;
  end;

  TDog = class(TAnimal)
  public
    function Speak: string; override;
  end;

constructor TAnimal.Create(name: string);
begin
  FName := name;
end;

function TAnimal.Speak: string;
begin
  Speak := FName + ' makes a sound';
end;

function TDog.Speak: string;
begin
  Speak := FName + ' barks';
end;

var
  animals: array[0..1] of TAnimal;
  i: Integer;
begin
  animals[0] := TAnimal.Create('Generic Animal');
  animals[1] := TDog.Create('Rex');
  for i := 0 to 1 do
    WriteLn(animals[i].Speak);
  for i := 0 to 1 do
    animals[i].Free;
end.
