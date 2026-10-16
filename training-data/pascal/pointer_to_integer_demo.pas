program PointerToIntegerDemo;

type
  PInteger = ^Integer;

var
  a: Integer;
  p, q: PInteger;
begin
  a := 10;
  p := @a;
  WriteLn('a via p: ', p^);
  p^ := 25;
  WriteLn('a after write: ', a);

  New(q);
  q^ := p^ * 2;
  WriteLn('heap value: ', q^);
  WriteLn('p = q: ', p = q);
  Dispose(q);
  q := nil;
  WriteLn('q is nil: ', q = nil);
  q := p;
  WriteLn('now p = q: ', p = q);
end.
