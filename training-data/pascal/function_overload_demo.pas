program FunctionOverloadDemo;

{$mode objfpc}

function Max(a, b: Integer): Integer; overload;
begin
  if a > b then Result := a else Result := b;
end;

function Max(a, b: Double): Double; overload;
begin
  if a > b then Result := a else Result := b;
end;

function Max(a, b, c: Integer): Integer; overload;
begin
  Result := Max(Max(a, b), c);
end;

function Describe(const s: string): string; overload;
begin
  Result := 'string:' + s;
end;

function Describe(n: Integer): string; overload;
begin
  Result := 'int:' + IntToStr(n);
end;

begin
  WriteLn(Max(3, 9));
  WriteLn(Max(2.5, 1.5):0:1);
  WriteLn(Max(4, 8, 6));
  WriteLn(Describe('hi'));
  WriteLn(Describe(7));
end.
