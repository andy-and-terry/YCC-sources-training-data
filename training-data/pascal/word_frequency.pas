program WordFrequencyDemo;

type
  WordCount = record
    word: string;
    count: Integer;
  end;

var
  text: string;
  words: array[0..9] of WordCount;
  wordCount: Integer;
  i, j, start: Integer;
  currentWord: string;
  found: Boolean;
begin
  text := 'the quick brown fox the lazy fox';
  wordCount := 0;
  start := 1;
  for i := 1 to Length(text) + 1 do
  begin
    if (i > Length(text)) or (text[i] = ' ') then
    begin
      if i > start then
      begin
        currentWord := Copy(text, start, i - start);
        found := False;
        for j := 0 to wordCount - 1 do
          if words[j].word = currentWord then
          begin
            words[j].count := words[j].count + 1;
            found := True;
          end;
        if not found then
        begin
          words[wordCount].word := currentWord;
          words[wordCount].count := 1;
          wordCount := wordCount + 1;
        end;
      end;
      start := i + 1;
    end;
  end;
  for i := 0 to wordCount - 1 do
    WriteLn(words[i].word, ': ', words[i].count);
end.
