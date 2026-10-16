{$mode objfpc}{$H+}
program TypedConstantCounterDemo;

{$J+}
const
  CallCount: Integer = 0;

procedure Visit;
begin
  Inc(CallCount);
  WriteLn('visit number ', CallCount);
end;

function NextId: Integer;
const
  Last: Integer = 100;
begin
  Inc(Last);
  Result := Last;
end;

begin
  Visit;
  Visit;
  Visit;
  WriteLn('ids: ', NextId, ' ', NextId, ' ', NextId);
end.
