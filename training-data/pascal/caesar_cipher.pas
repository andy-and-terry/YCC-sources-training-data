program CaesarCipherDemo;

const
  Shift = 3;

function Encrypt(const s: string; shift: Integer): string;
var
  i: Integer;
  c: Char;
begin
  Encrypt := s;
  for i := 1 to Length(s) do
  begin
    c := s[i];
    if (c >= 'a') and (c <= 'z') then
      Encrypt[i] := Chr((Ord(c) - Ord('a') + shift) mod 26 + Ord('a'))
    else if (c >= 'A') and (c <= 'Z') then
      Encrypt[i] := Chr((Ord(c) - Ord('A') + shift) mod 26 + Ord('A'));
  end;
end;

function Decrypt(const s: string; shift: Integer): string;
begin
  Decrypt := Encrypt(s, 26 - (shift mod 26));
end;

var
  message, encrypted, decrypted: string;
begin
  message := 'Hello World';
  encrypted := Encrypt(message, Shift);
  decrypted := Decrypt(encrypted, Shift);
  WriteLn(encrypted);
  WriteLn(decrypted);
end.
