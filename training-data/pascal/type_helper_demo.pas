{$mode objfpc}{$H+}
{$modeswitch typehelpers}
program TypeHelperDemo;

uses SysUtils;

type
  TIntHelper = type helper for Integer
    function IsEven: Boolean;
    function Squared: Integer;
  end;

  TStrHelper = type helper for string
    function Shout: string;
  end;

function TIntHelper.IsEven: Boolean;
begin
  Result := (Self mod 2) = 0;
end;

function TIntHelper.Squared: Integer;
begin
  Result := Self * Self;
end;

function TStrHelper.Shout: string;
begin
  Result := UpperCase(Self) + '!';
end;

var
  n: Integer;
  s: string;
begin
  n := 7;
  s := 'hello';
  WriteLn(n.IsEven);
  WriteLn(n.Squared);
  WriteLn((12).IsEven);
  WriteLn(s.Shout);
end.
