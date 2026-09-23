program QueueViaTwoStacksDemo;

const
  MaxSize = 100;

var
  inStack, outStack: array[0..MaxSize-1] of Integer;
  inTop, outTop: Integer;

procedure Enqueue(value: Integer);
begin
  inTop := inTop + 1;
  inStack[inTop] := value;
end;

function Dequeue: Integer;
begin
  if outTop = -1 then
    while inTop >= 0 do
    begin
      outTop := outTop + 1;
      outStack[outTop] := inStack[inTop];
      inTop := inTop - 1;
    end;
  Dequeue := outStack[outTop];
  outTop := outTop - 1;
end;

begin
  inTop := -1;
  outTop := -1;
  Enqueue(1);
  Enqueue(2);
  Enqueue(3);
  WriteLn(Dequeue);
  Enqueue(4);
  WriteLn(Dequeue);
  WriteLn(Dequeue);
  WriteLn(Dequeue);
end.
