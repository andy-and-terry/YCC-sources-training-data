program TrieDemo;

type
  PTrieNode = ^TTrieNode;
  TTrieNode = record
    children: array[0..25] of PTrieNode;
    isEnd: Boolean;
  end;

function NewTrieNode: PTrieNode;
var
  node: PTrieNode;
  i: Integer;
begin
  New(node);
  for i := 0 to 25 do node^.children[i] := nil;
  node^.isEnd := False;
  NewTrieNode := node;
end;

procedure TrieInsert(root: PTrieNode; word: string);
var
  node: PTrieNode;
  i, idx: Integer;
begin
  node := root;
  for i := 1 to Length(word) do
  begin
    idx := Ord(word[i]) - Ord('a');
    if node^.children[idx] = nil then node^.children[idx] := NewTrieNode;
    node := node^.children[idx];
  end;
  node^.isEnd := True;
end;

function TrieContains(root: PTrieNode; word: string): Boolean;
var
  node: PTrieNode;
  i, idx: Integer;
begin
  node := root;
  for i := 1 to Length(word) do
  begin
    idx := Ord(word[i]) - Ord('a');
    if node^.children[idx] = nil then begin TrieContains := False; Exit; end;
    node := node^.children[idx];
  end;
  TrieContains := node^.isEnd;
end;

var
  root: PTrieNode;
begin
  root := NewTrieNode;
  TrieInsert(root, 'cat');
  TrieInsert(root, 'car');
  WriteLn(TrieContains(root, 'cat'));
  WriteLn(TrieContains(root, 'ca'));
end.
