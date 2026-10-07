{$mode objfpc}{$H+}
program GenericDictionaryDemo;

uses SysUtils, Generics.Collections;

type
  TCountMap = specialize TDictionary<string, Integer>;

var
  counts: TCountMap;
  words: array[0..5] of string = ('red', 'blue', 'red', 'green', 'blue', 'red');
  w: string;
  pair: TCountMap.TDictionaryPair;
  n: Integer;
begin
  counts := TCountMap.Create;
  try
    for w in words do
      if counts.TryGetValue(w, n) then
        counts[w] := n + 1
      else
        counts.Add(w, 1);
    for pair in counts do
      WriteLn(pair.Key, ' = ', pair.Value);
    WriteLn('contains green: ', counts.ContainsKey('green'));
    counts.Remove('green');
    WriteLn('count: ', counts.Count);
  finally
    counts.Free;
  end;
end.
