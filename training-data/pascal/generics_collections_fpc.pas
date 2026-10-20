{$mode objfpc}{$H+}
program GenericsCollectionsFpc;

uses Generics.Collections, SysUtils;

type
  generic TBox<T> = class
    Value: T;
    function Describe: string;
  end;

function TBox.Describe: string;
begin Result := 'box'; end;

var
  L: specialize TList<Integer>;
  D: specialize TDictionary<string, Integer>;
  S: specialize TStack<string>;
  Q: specialize TQueue<Integer>;
  B: specialize TBox<Integer>;
  I: Integer;
  P: specialize TPair<string, Integer>;
begin
  L := specialize TList<Integer>.Create;
  D := specialize TDictionary<string, Integer>.Create;
  S := specialize TStack<string>.Create;
  Q := specialize TQueue<Integer>.Create;
  B := specialize TBox<Integer>.Create;
  try
    for I := 5 downto 1 do L.Add(I);
    L.Sort;
    D.Add('a', 1); D.AddOrSetValue('a', 9);
    S.Push('x'); S.Push('y');
    Q.Enqueue(1); Q.Enqueue(2);
    B.Value := 7;
    WriteLn(L[0], ' ', L.Count, ' ', D['a'], ' ', S.Pop, ' ', Q.Dequeue, ' ', B.Value, ' ', D.ContainsKey('z'));
    for P in D do WriteLn(P.Key, '=', P.Value);
  finally
    L.Free; D.Free; S.Free; Q.Free; B.Free;
  end;
end.
