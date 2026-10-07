{$mode objfpc}{$H+}
program FormatFunctionDemo;

uses SysUtils;

begin
  WriteLn(Format('Name: %s, age: %d', ['Ada', 36]));
  WriteLn(Format('Pi is about %.3f', [Pi]));
  WriteLn(Format('[%5d] [%-5d] [%05d]', [42, 42, 42]));
  WriteLn(Format('Hex: %x  Upper: %X', [255, 255]));
  WriteLn(Format('[%10s] [%-10s]', ['right', 'left']));
  WriteLn(Format('%d%% done', [75]));
  WriteLn(Format('%2:s %0:s %1:s', ['a', 'b', 'c']));
  WriteLn(FloatToStrF(1234567.891, ffNumber, 12, 2));
  WriteLn(IntToStr(99) + ' / ' + FloatToStr(2.5));
  WriteLn(UpperCase('shout'), ' ', LowerCase('QUIET'), ' ', IntToHex(48879, 4));
end.
