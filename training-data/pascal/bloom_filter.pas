program BloomFilterDemo;

const
  Size = 64;

var
  bits: array[0..Size - 1] of Boolean;

function Hash1(const s: String): Integer;
var
  i, h: Integer;
begin
  h := 0;
  for i := 1 to Length(s) do
    h := (h * 31 + Ord(s[i])) mod Size;
  Hash1 := h;
end;

function Hash2(const s: String): Integer;
var
  i, h: Integer;
begin
  h := 0;
  for i := 1 to Length(s) do
    h := (h * 17 + Ord(s[i]) + 7) mod Size;
  Hash2 := h;
end;

procedure AddItem(const s: String);
begin
  bits[Hash1(s)] := True;
  bits[Hash2(s)] := True;
end;

function MightContain(const s: String): Boolean;
begin
  MightContain := bits[Hash1(s)] and bits[Hash2(s)];
end;

var
  i: Integer;
begin
  for i := 0 to Size - 1 do bits[i] := False;
  AddItem('apple');
  AddItem('banana');
  WriteLn(MightContain('apple'));
  WriteLn(MightContain('cherry'));
end.
