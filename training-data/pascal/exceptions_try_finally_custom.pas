{$mode objfpc}{$H+}
program ExceptionsTryFinallyCustom;

uses SysUtils;

const
  Vals: array[0..2] of Integer = (5, -1, 0);

type
  EValidation = class(Exception)
    Code: Integer;
    constructor Create(const Msg: string; ACode: Integer);
  end;

constructor EValidation.Create(const Msg: string; ACode: Integer);
begin inherited Create(Msg); Code := ACode; end;

procedure Check(N: Integer);
begin
  if N < 0 then raise EValidation.Create('negative', 7);
  if N = 0 then raise EDivByZero.Create('zero');
  WriteLn(100 div N);
end;

var I: Integer;
begin
  for I in Vals do
  try
    try
      Check(I);
    except
      on E: EValidation do WriteLn('validation ', E.Message, ' ', E.Code);
      on E: EDivByZero do WriteLn('div ', E.Message);
    end;
  finally
    WriteLn('done ', I);
  end;
  try StrToInt('abc'); except on E: EConvertError do WriteLn('convert: ', E.Message); end;
  try raise Exception.CreateFmt('%d-%s', [1, 'x']); except on E: Exception do WriteLn(E.Message); end;
end.
