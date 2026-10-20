{$mode objfpc}{$H+}
program FileIoTextfileStream;

uses SysUtils, Classes;

var
  F: TextFile;
  Line, Name: string;
  SL: TStringList;
  FS: TFileStream;
  B: Byte;
begin
  Name := GetTempFileName;
  AssignFile(F, Name);
  Rewrite(F);
  WriteLn(F, 'alpha'); WriteLn(F, 'beta'); WriteLn(F, 42);
  CloseFile(F);
  Reset(F);
  while not Eof(F) do begin ReadLn(F, Line); WriteLn('> ', Line); end;
  CloseFile(F);
  SL := TStringList.Create;
  try
    SL.LoadFromFile(Name);
    SL.Add('gamma'); SL.Sort;
    WriteLn(SL.Count, ' ', SL.CommaText, ' ', SL.IndexOf('beta'));
    SL.SaveToFile(Name);
  finally SL.Free; end;
  FS := TFileStream.Create(Name, fmOpenRead);
  try FS.ReadBuffer(B, 1); WriteLn(Char(B), ' ', FS.Size > 0); finally FS.Free; end;
  WriteLn(FileExists(Name)); DeleteFile(Name); WriteLn(FileExists(Name));
end.
