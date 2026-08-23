program NestedProceduresDemo;

function Outer(x: Integer): Integer;
  function InnerDouble(n: Integer): Integer;
  begin
    InnerDouble := n * 2;
  end;
  function InnerTriple(n: Integer): Integer;
  begin
    InnerTriple := n * 3;
  end;
begin
  Outer := InnerDouble(x) + InnerTriple(x);
end;

begin
  WriteLn(Outer(5));
end.
