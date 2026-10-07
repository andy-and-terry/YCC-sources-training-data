program TypedFileDemo;

type
  TRec = record
    Id: Integer;
    Score: Double;
  end;

var
  f: file of TRec;
  r: TRec;
  i: Integer;
begin
  Assign(f, 'typed_demo.dat');
  Rewrite(f);
  for i := 1 to 3 do
  begin
    r.Id := i;
    r.Score := i * 1.5;
    Write(f, r);
  end;
  Close(f);

  Reset(f);
  Seek(f, 1);
  Read(f, r);
  WriteLn(r.Id, ' ', r.Score:0:1);
  WriteLn(FileSize(f));
  Close(f);
  Erase(f);
end.
