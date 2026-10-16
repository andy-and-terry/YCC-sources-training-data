program CountWordsLinesDemo;

var
  text: string;
  i, words: Integer;
  inWord: Boolean;
begin
  text := 'Pascal was designed by  Niklaus Wirth  in 1970';
  words := 0;
  inWord := False;
  for i := 1 to Length(text) do
  begin
    if text[i] <> ' ' then
    begin
      if not inWord then Inc(words);
      inWord := True;
    end
    else
      inWord := False;
  end;
  WriteLn('characters: ', Length(text));
  WriteLn('words: ', words);
end.
