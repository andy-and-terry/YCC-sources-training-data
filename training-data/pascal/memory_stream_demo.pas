program MemoryStreamDemo;

{$mode objfpc}{$H+}

uses Classes, SysUtils;

type
  TPoint3 = record
    X, Y, Z: Integer;
  end;

var
  ms: TMemoryStream;
  p, q: TPoint3;
  n: Integer;
  text: string;
begin
  ms := TMemoryStream.Create;
  try
    p.X := 10; p.Y := 20; p.Z := 30;
    ms.WriteBuffer(p, SizeOf(p));

    n := 12345;
    ms.WriteBuffer(n, SizeOf(n));

    text := 'hello';
    ms.WriteBuffer(text[1], Length(text));

    WriteLn('stream size: ', ms.Size, ' bytes');
    WriteLn('position:    ', ms.Position);

    ms.Position := 0;
    ms.ReadBuffer(q, SizeOf(q));
    WriteLn('point: ', q.X, ',', q.Y, ',', q.Z);

    n := 0;
    ms.ReadBuffer(n, SizeOf(n));
    WriteLn('integer: ', n);

    SetLength(text, 5);
    ms.ReadBuffer(text[1], 5);
    WriteLn('text: ', text);
    WriteLn('at end: ', ms.Position = ms.Size);

    ms.Seek(SizeOf(TPoint3), soBeginning);
    ms.ReadBuffer(n, SizeOf(n));
    WriteLn('after seek: ', n);
  finally
    ms.Free;
  end;
end.
