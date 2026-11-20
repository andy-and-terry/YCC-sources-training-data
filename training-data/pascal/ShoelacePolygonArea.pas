program ShoelacePolygonArea;
{ Shoelace polygon area with a record type. }
type TPoint = record x, y: Double; end;
const P: array[0..3] of TPoint = ((x: 0; y: 0), (x: 4; y: 0), (x: 4; y: 3), (x: 0; y: 3));
var i, j: Integer; s: Double;
begin
  s := 0;
  for i := 0 to 3 do begin
    j := (i + 1) mod 4;
    s := s + P[i].x * P[j].y - P[j].x * P[i].y;
  end;
  WriteLn(Abs(s) / 2:0:1);
end.
