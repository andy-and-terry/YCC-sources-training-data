program DefaultIndexedPropertyDemo;

{$mode objfpc}{$H+}

uses SysUtils;

type
  TGrid = class
  private
    FCells: array of Integer;
    FWidth, FHeight: Integer;
    function GetCell(Col, Row: Integer): Integer;
    procedure SetCell(Col, Row: Integer; Value: Integer);
    function GetRowText(Row: Integer): string;
  public
    constructor Create(AWidth, AHeight: Integer);
    property Cells[Col, Row: Integer]: Integer read GetCell write SetCell; default;
    property RowText[Row: Integer]: string read GetRowText;
  end;

constructor TGrid.Create(AWidth, AHeight: Integer);
begin
  inherited Create;
  FWidth := AWidth;
  FHeight := AHeight;
  SetLength(FCells, AWidth * AHeight);
end;

function TGrid.GetCell(Col, Row: Integer): Integer;
begin
  if (Col < 0) or (Col >= FWidth) or (Row < 0) or (Row >= FHeight) then
    raise ERangeError.CreateFmt('cell (%d,%d) out of range', [Col, Row]);
  Result := FCells[Row * FWidth + Col];
end;

procedure TGrid.SetCell(Col, Row: Integer; Value: Integer);
begin
  GetCell(Col, Row);  // reuse the range check
  FCells[Row * FWidth + Col] := Value;
end;

function TGrid.GetRowText(Row: Integer): string;
var
  c: Integer;
begin
  Result := '';
  for c := 0 to FWidth - 1 do
    Result := Result + Format('%3d', [Cells[c, Row]]);
end;

var
  g: TGrid;
  r, c: Integer;
begin
  g := TGrid.Create(4, 3);
  try
    for r := 0 to 2 do
      for c := 0 to 3 do
        g[c, r] := (c + 1) * (r + 1);   // default property: no name needed
    for r := 0 to 2 do
      WriteLn('row ', r, ':', g.RowText[r]);
    try
      WriteLn(g[9, 9]);
    except
      on E: ERangeError do WriteLn('error: ', E.Message);
    end;
  finally
    g.Free;
  end;
end.
