program ValidParenthesesDemo;

function IsValid(s: string): Boolean;
var
  stack: array[0..99] of Char;
  top, i: Integer;
  c: Char;
begin
  top := -1;
  IsValid := True;
  for i := 1 to Length(s) do
  begin
    c := s[i];
    if (c = '(') or (c = '[') or (c = '{') then
    begin
      top := top + 1;
      stack[top] := c;
    end
    else if (c = ')') or (c = ']') or (c = '}') then
    begin
      if top < 0 then begin IsValid := False; Exit; end;
      if ((c = ')') and (stack[top] <> '(')) or
         ((c = ']') and (stack[top] <> '[')) or
         ((c = '}') and (stack[top] <> '{')) then
      begin
        IsValid := False; Exit;
      end;
      top := top - 1;
    end;
  end;
  if top >= 0 then IsValid := False;
end;

begin
  WriteLn(IsValid('{[()]}'));
  WriteLn(IsValid('{[(])}'));
end.
