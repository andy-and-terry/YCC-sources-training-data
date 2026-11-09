program GenericsSpecialize;
{$mode objfpc}
type
  generic TBox<T> = class
    Value: T;
  end;
  TIntBox = specialize TBox<Integer>;
var b: TIntBox;
begin
  b := TIntBox.Create;
  b.Value := 42;
  WriteLn(b.Value);
  b.Free;
end.
