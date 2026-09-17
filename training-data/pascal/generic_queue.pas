program GenericQueueDemo;

const
  MaxSize = 100;

type
  IntQueue = record
    items: array[0..MaxSize - 1] of Integer;
    head: Integer;
    tail: Integer;
    count: Integer;
  end;

procedure InitQueue(var q: IntQueue);
begin
  q.head := 0;
  q.tail := 0;
  q.count := 0;
end;

procedure Enqueue(var q: IntQueue; value: Integer);
begin
  q.items[q.tail] := value;
  q.tail := (q.tail + 1) mod MaxSize;
  q.count := q.count + 1;
end;

function Dequeue(var q: IntQueue): Integer;
begin
  Dequeue := q.items[q.head];
  q.head := (q.head + 1) mod MaxSize;
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
  WriteLn('remaining: ', q.count);
end.
