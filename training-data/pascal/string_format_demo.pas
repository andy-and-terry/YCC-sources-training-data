program StringFormatDemo;

uses SysUtils;

begin
  WriteLn(Format('%d items at %.2f each', [3, 4.5]));
  WriteLn(Format('%5d|%-5d|%05d', [42, 42, 42]));
  WriteLn(Format('%s is %d years', ['Ann', 30]));
  WriteLn(Format('%x %8.3f', [255, 3.14159]));
  WriteLn(FloatToStrF(1234.5678, ffFixed, 8, 2));
end.
