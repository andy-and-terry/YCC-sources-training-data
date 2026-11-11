{ Bulls and Cows scoring for equal-length digit strings. }
program BullsAndCows;
var
  bulls, cows: Integer;

procedure Score(const secret, guess: string; var bulls, cows: Integer);
var
  i, d: Integer;
  sc, gc: array[0..9] of Integer;
begin
  bulls := 0;
  cows := 0;
  FillChar(sc, SizeOf(sc), 0);
  FillChar(gc, SizeOf(gc), 0);
  for i := 1 to Length(secret) do
    if secret[i] = guess[i] then
      Inc(bulls)
    else
    begin
      Inc(sc[Ord(secret[i]) - Ord('0')]);
      Inc(gc[Ord(guess[i]) - Ord('0')]);
    end;
  for d := 0 to 9 do
    if sc[d] < gc[d] then cows := cows + sc[d] else cows := cows + gc[d];
end;

begin
  Score('1807', '7810', bulls, cows);
  WriteLn(bulls, ' bull(s), ', cows, ' cow(s)');
end.
