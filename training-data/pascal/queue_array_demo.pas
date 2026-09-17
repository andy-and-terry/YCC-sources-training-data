program QueueArrayDemo;

const
  Capacity = 5;

type
  IntQueue = record
    items: array[0..Capacity - 1] of Integer;
    front, rear, count: Integer;
  end;

procedure InitQueue(var q: IntQueue);
begin
  q.front := 0;
  q.rear := 0;
  q.count := 0;
end;

function IsFull(const q: IntQueue): Boolean;
begin
  IsFull := q.count = Capacity;
end;

function IsEmpty(const q: IntQueue): Boolean;
begin
  IsEmpty := q.count = 0;
end;

procedure Enqueue(var q: IntQueue; value: Integer);
begin
  if IsFull(q) then Exit;
  q.items[q.rear] := value;
  q.rear := (q.rear + 1) mod Capacity;
  q.count := q.count + 1;
end;

function Dequeue(var q: IntQueue): Integer;
begin
  if IsEmpty(q) then
  begin
    Dequeue := -1;
    Exit;
  end;
  Dequeue := q.items[q.front];
  q.front := (q.front + 1) mod Capacity;
  q.count := q.count - 1;
end;

var
  q: IntQueue;
begin
  InitQueue(q);
  Enqueue(q, 10);
  Enqueue(q, 20);
  Enqueue(q, 30);
  WriteLn(Dequeue(q));
  WriteLn(Dequeue(q));
  Enqueue(q, 40);
  WriteLn(Dequeue(q));
  WriteLn(Dequeue(q));
end.
