program StackDemo;

type
  TStack = record
    items: array[0..99] of Integer;
    top: Integer;
  end;

procedure Push(var s: TStack; value: Integer);
begin
  s.top := s.top + 1;
  s.items[s.top] := value;
end;

function Pop(var s: TStack): Integer;
begin
  Pop := s.items[s.top];
  s.top := s.top - 1;
end;

function IsEmpty(var s: TStack): Boolean;
begin
  IsEmpty := s.top < 0;
end;

var
  stack: TStack;
begin
  stack.top := -1;
  Push(stack, 1);
  Push(stack, 2);
  Push(stack, 3);
  WriteLn(Pop(stack), ' ', IsEmpty(stack));
end.
