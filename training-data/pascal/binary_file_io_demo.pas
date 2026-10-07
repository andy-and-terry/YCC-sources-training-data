program BinaryFileIoDemo;

type
  TRecord = record
    id: Integer;
    score: Real;
  end;

var
  f: file of TRecord;
  r: TRecord;
  i: Integer;
begin
  Assign(f, 'records.tmp');
  Rewrite(f);
  for i := 1 to 4 do
  begin
    r.id := i;
    r.score := i * 12.5;
    Write(f, r);
  end;
  Close(f);

  Reset(f);
  WriteLn('records: ', FileSize(f));
  Seek(f, 2);
  Read(f, r);
  WriteLn('third: id=', r.id, ' score=', r.score:0:1);
  Seek(f, 0);
  while not Eof(f) do
  begin
    Read(f, r);
    Write(r.id, ' ');
  end;
  WriteLn;
  Close(f);
  Erase(f);
end.
