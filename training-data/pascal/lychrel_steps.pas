program LychrelSteps;
{ Reverse-and-add until a palindrome; count the steps. }

function ReverseDigits(n: Int64): Int64;
begin
  ReverseDigits := 0;
  while n > 0 do
  begin
    ReverseDigits := ReverseDigits * 10 + n mod 10;
    n := n div 10;
  end;
end;

function Steps(n: Int64): Integer;
var
  count: Integer;
begin
  Steps := -1;
  for count := 0 to 49 do
  begin
    if (count > 0) and (n = ReverseDigits(n)) then
    begin
      Steps := count;
      Exit;
    end;
    n := n + ReverseDigits(n);
  end;
end;

const
  Starts: array[1..5] of Integer = (56, 57, 59, 79, 89);
var
  i: Integer;
begin
  for i := 1 to 5 do
    Write(Steps(Starts[i]), ' ');
  WriteLn;
end.
