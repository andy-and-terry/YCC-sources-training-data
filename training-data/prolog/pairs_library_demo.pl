:- use_module(library(pairs)).

:- pairs_keys_values(Ps, [a, b, c], [1, 2, 3]), writeln(Ps).
:- pairs_keys([x-1, y-2], Ks), writeln(Ks).
:- pairs_values([x-1, y-2], Vs), writeln(Vs).
:- transpose_pairs([a-1, b-2], T), writeln(T).

% Sort items by a computed key using pairs.
:- Words = [pear, fig, banana, kiwi],
   findall(Len-W, (member(W, Words), atom_length(W, Len)), Ps),
   keysort(Ps, Sorted),
   pairs_values(Sorted, ByLength),
   writeln(ByLength).

:- map_list_to_pairs(atom_length, [aaa, b, cc], Ps), keysort(Ps, S), writeln(S).
