program GenericStackDemo;

type
  IntStack = record
    items: array[0..99] of Integer;
    top: Integer;
  end;

procedure Push(var s: IntStack; value: Integer);
begin
  s.top := s.top + 1;
  s.items[s.top] := value;
end;

function Pop(var s: IntStack): Integer;
begin
  Pop := s.items[s.top];
  s.top := s.top - 1;
end;

var
  s: IntStack;
begin
  s.top := -1;
  Push(s, 1);
  Push(s, 2);
  Push(s, 3);
  WriteLn(Pop(s));
  WriteLn(Pop(s));
end.
