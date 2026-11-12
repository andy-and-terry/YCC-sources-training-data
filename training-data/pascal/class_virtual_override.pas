program VirtDemo;
{$mode objfpc}
type
  TA = class procedure Hi; virtual; end;
  TB = class(TA) procedure Hi; override; end;
procedure TA.Hi; begin writeln('A'); end;
procedure TB.Hi; begin writeln('B'); end;
var o: TA;
begin o := TB.Create; o.Hi; o.Free; end.
