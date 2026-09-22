program TextFileIODemo;

var
  f: Text;
  line: string;
begin
  Assign(f, 'demo_output.txt');
  Rewrite(f);
  WriteLn(f, 'Hello, Pascal!');
  WriteLn(f, 'Line two.');
  Close(f);

  Assign(f, 'demo_output.txt');
  Reset(f);
  while not Eof(f) do
  begin
    ReadLn(f, line);
    WriteLn(line);
  end;
  Close(f);
end.
