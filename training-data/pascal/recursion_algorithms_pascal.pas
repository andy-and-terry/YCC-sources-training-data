program RecursionAlgorithmsPascal;

function Fact(N: Integer): Int64;
begin if N <= 1 then Result := 1 else Result := N * Fact(N - 1); end;

function Fib(N: Integer): Integer;
begin if N < 2 then Result := N else Result := Fib(N - 1) + Fib(N - 2); end;

function Gcd(A, B: Integer): Integer;
begin if B = 0 then Result := A else Result := Gcd(B, A mod B); end;

procedure Hanoi(N: Integer; F, T, V: Char; var Moves: Integer);
begin
  if N = 0 then Exit;
  Hanoi(N - 1, F, V, T, Moves); Inc(Moves); Hanoi(N - 1, V, T, F, Moves);
end;

function IsPalindrome(const S: string): Boolean;
begin
  if Length(S) < 2 then Result := True
  else Result := (S[1] = S[Length(S)]) and IsPalindrome(Copy(S, 2, Length(S) - 2));
end;

function Power(B: Double; E: Integer): Double;
begin
  if E = 0 then Result := 1
  else if Odd(E) then Result := B * Power(B, E - 1)
  else Result := Sqr(Power(B, E div 2));
end;

var M: Integer;
begin
  M := 0; Hanoi(8, 'A', 'C', 'B', M);
  WriteLn(Fact(20), ' ', Fib(20), ' ', Gcd(48, 18), ' ', M, ' ', IsPalindrome('racecar'), ' ', Power(2, 20):0:0);
end.
