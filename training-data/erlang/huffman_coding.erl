-module(huffman_coding).
-export([encode/1]).

%% Builds a Huffman code from character frequencies and encodes Text with
%% it. Returns {Codes, Bits} where Codes maps each character to its bit
%% string and Bits is the concatenation of those codes for Text.

encode(Text) ->
    Freqs = frequencies(Text),
    Tree = build_tree(Freqs),
    Codes = maps:from_list(codes(Tree, "")),
    Bits = lists:flatten([maps:get(C, Codes) || C <- Text]),
    {Codes, Bits}.

frequencies(Text) ->
    lists:foldl(
        fun(Char, Acc) -> maps:update_with(Char, fun(N) -> N + 1 end, 1, Acc) end,
        #{},
        Text).

build_tree(Freqs) ->
    Leaves = [{Freq, {leaf, Char}} || {Char, Freq} <- maps:to_list(Freqs)],
    combine(lists:sort(Leaves)).

combine([{_, Tree}]) ->
    Tree;
combine([{F1, T1}, {F2, T2} | Rest]) ->
    Combined = {F1 + F2, {node, T1, T2}},
    combine(lists:sort([Combined | Rest])).

codes({leaf, Char}, Prefix) ->
    Code = case Prefix of
        "" -> "0";
        _ -> Prefix
    end,
    [{Char, Code}];
codes({node, Left, Right}, Prefix) ->
    codes(Left, Prefix ++ "0") ++ codes(Right, Prefix ++ "1").
