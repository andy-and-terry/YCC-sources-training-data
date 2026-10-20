{$mode objfpc}{$H+}
program DynamicArraysOpenArrays;

type
  TIntArray = array of Integer;

function Sum(const A: array of Integer): Integer;
var I: Integer;
begin Result := 0; for I := Low(A) to High(A) do Result += A[I]; end;

procedure Fill(var A: TIntArray; N: Integer);
var I: Integer;
begin SetLength(A, N); for I := 0 to N - 1 do A[I] := I * I; end;

var
  A, B: TIntArray;
  M: array of array of Integer;
  I, J: Integer;
begin
  Fill(A, 6);
  WriteLn(Sum(A), ' ', Length(A), ' ', Sum([1, 2, 3]));
  B := Copy(A, 2, 3);
  SetLength(A, 8);
  WriteLn(B[0], ' ', B[2], ' ', Length(A), ' ', High(B));
  SetLength(M, 3, 3);
  for I := 0 to 2 do for J := 0 to 2 do M[I][J] := I * 3 + J;
  WriteLn(M[2][1], ' ', Length(M[0]));
  A := nil;
  WriteLn(Length(A));
end.
