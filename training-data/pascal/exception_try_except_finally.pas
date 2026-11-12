program ExcDemo;
{$mode objfpc}
uses SysUtils;
begin
  try
    try raise Exception.Create('boom');
    except on e: Exception do writeln('caught ', e.Message); end;
  finally writeln('done'); end;
end.
