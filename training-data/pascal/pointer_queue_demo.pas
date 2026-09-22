program PointerQueueDemo;

type
  PNode = ^TNode;
  TNode = record
    value: Integer;
    next: PNode;
  end;

  TQueue = record
    head, tail: PNode;
  end;

procedure InitQueue(var q: TQueue);
begin
  q.head := nil;
  q.tail := nil;
end;

procedure Enqueue(var q: TQueue; value: Integer);
var
  newNode: PNode;
begin
  New(newNode);
  newNode^.value := value;
  newNode^.next := nil;
  if q.tail = nil then
    q.head := newNode
  else
    q.tail^.next := newNode;
  q.tail := newNode;
end;

function Dequeue(var q: TQueue): Integer;
var
  oldHead: PNode;
begin
  Dequeue := q.head^.value;
  oldHead := q.head;
  q.head := q.head^.next;
  if q.head = nil then
    q.tail := nil;
  Dispose(oldHead);
end;

function IsEmpty(const q: TQueue): Boolean;
begin
  IsEmpty := q.head = nil;
end;

var
  q: TQueue;
begin
  InitQueue(q);
  Enqueue(q, 1);
  Enqueue(q, 2);
  Enqueue(q, 3);
  while not IsEmpty(q) do
    Write(Dequeue(q), ' ');
  WriteLn;
end.
