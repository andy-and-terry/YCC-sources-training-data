% Huffman coding: repeatedly merge the two lowest-frequency nodes into
% a parent node until one tree remains, then read off codes top-down.
% The tree itself is just a Label (an atom leaf, or node(Left, Right));
% freq/2 wrapping only exists to keep each node's weight next to it
% while picking the next pair to merge.
huffman(Freqs, Codes) :-
    build_tree(Freqs, freq(_, Tree)),
    assign_codes(Tree, "", Codes).

build_tree([Tree], Tree) :- !.
build_tree(Nodes, Tree) :-
    msort(Nodes, [freq(F1, N1), freq(F2, N2)|Rest]),
    MergedFreq is F1 + F2,
    Merged = freq(MergedFreq, node(N1, N2)),
    build_tree([Merged|Rest], Tree).

assign_codes(Leaf, Prefix, [Leaf-Prefix]) :- atom(Leaf), !.
assign_codes(node(Left, Right), Prefix, Codes) :-
    string_concat(Prefix, "0", LPrefix),
    string_concat(Prefix, "1", RPrefix),
    assign_codes(Left, LPrefix, LCodes),
    assign_codes(Right, RPrefix, RCodes),
    append(LCodes, RCodes, Codes).

:- Freqs = [freq(5, a), freq(9, b), freq(12, c), freq(13, d)],
   huffman(Freqs, Codes),
   writeln(Codes).
