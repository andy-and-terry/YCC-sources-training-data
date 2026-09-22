program PackedRecordDemo;

type
  // `packed` asks the compiler to lay the fields out as tightly as
  // possible (no alignment padding between them) instead of using
  // whatever layout is fastest to access, trading some access speed
  // for a smaller, predictable in-memory representation.
  TColor = packed record
    red, green, blue: Byte;
  end;

  TFlags = packed record
    isVisible: Boolean;
    isEnabled: Boolean;
    isSelected: Boolean;
  end;

function ColorToHex(c: TColor): string;
const
  hexDigits: string = '0123456789ABCDEF';
  channels = 3;
var
  i, n: Integer;
  values: array[0..channels - 1] of Byte;
  s: string;
begin
  values[0] := c.red;
  values[1] := c.green;
  values[2] := c.blue;
  s := '';
  for i := 0 to channels - 1 do
  begin
    n := values[i];
    s := s + hexDigits[(n div 16) + 1] + hexDigits[(n mod 16) + 1];
  end;
  ColorToHex := s;
end;

var
  orange: TColor;
  flags: TFlags;
begin
  orange.red := 255;
  orange.green := 165;
  orange.blue := 0;
  WriteLn('#', ColorToHex(orange));
  WriteLn('sizeof(TColor) = ', SizeOf(TColor));

  flags.isVisible := True;
  flags.isEnabled := True;
  flags.isSelected := False;
  WriteLn(flags.isVisible, ' ', flags.isEnabled, ' ', flags.isSelected);
  WriteLn('sizeof(TFlags) = ', SizeOf(TFlags));
end.
