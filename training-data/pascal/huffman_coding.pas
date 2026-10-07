program HuffmanCodingDemo;

const
  MaxSymbols = 26;

type
  TNode = record
    ch: Char;
    freq: Integer;
    left, right: Integer; { indices into nodes, -1 means none }
  end;

var
  nodes: array[0..2 * MaxSymbols] of TNode;
  nodeCount: Integer;
  active: array[0..MaxSymbols] of Integer;
  activeCount: Integer;
  codes: array[0..MaxSymbols] of String;

procedure BuildCodes(idx: Integer; prefix: String);
begin
  if (nodes[idx].left = -1) and (nodes[idx].right = -1) then
  begin
    if prefix = '' then
      codes[Ord(nodes[idx].ch)] := '0'
    else
      codes[Ord(nodes[idx].ch)] := prefix;
    Exit;
  end;
  if nodes[idx].left <> -1 then BuildCodes(nodes[idx].left, prefix + '0');
  if nodes[idx].right <> -1 then BuildCodes(nodes[idx].right, prefix + '1');
end;

var
  text: String;
  freqTable: array[0..255] of Integer;
  i, a, b, minA, minB, minFreqA, minFreqB: Integer;
begin
  text := 'abracadabra';
  for i := 0 to 255 do freqTable[i] := 0;
  for i := 1 to Length(text) do
    freqTable[Ord(text[i])] := freqTable[Ord(text[i])] + 1;

  nodeCount := 0;
  activeCount := 0;
  for i := 0 to 255 do
    if freqTable[i] > 0 then
    begin
      nodes[nodeCount].ch := Chr(i);
      nodes[nodeCount].freq := freqTable[i];
      nodes[nodeCount].left := -1;
      nodes[nodeCount].right := -1;
      active[activeCount] := nodeCount;
      activeCount := activeCount + 1;
      nodeCount := nodeCount + 1;
    end;

  while activeCount > 1 do
  begin
    minA := 0;
    for a := 1 to activeCount - 1 do
      if nodes[active[a]].freq < nodes[active[minA]].freq then minA := a;
    minFreqA := active[minA];

    minB := -1;
    for b := 0 to activeCount - 1 do
      if (b <> minA) and ((minB = -1) or (nodes[active[b]].freq < nodes[active[minB]].freq)) then
        minB := b;
    minFreqB := active[minB];

    nodes[nodeCount].ch := #0;
    nodes[nodeCount].freq := nodes[minFreqA].freq + nodes[minFreqB].freq;
    nodes[nodeCount].left := minFreqA;
    nodes[nodeCount].right := minFreqB;

    if minA < minB then
    begin
      active[minA] := nodeCount;
      for i := minB to activeCount - 2 do active[i] := active[i + 1];
    end
    else
    begin
      active[minB] := nodeCount;
      for i := minA to activeCount - 2 do active[i] := active[i + 1];
    end;
    activeCount := activeCount - 1;
    nodeCount := nodeCount + 1;
  end;

  BuildCodes(active[0], '');
  for i := 0 to 255 do
    if freqTable[i] > 0 then
      WriteLn(Chr(i), ': ', codes[i]);
end.
