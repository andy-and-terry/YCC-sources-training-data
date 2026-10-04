:- use_module(library(pairs)).
:- initialization(main).

main :-
    Pairs = [apple-3, pear-1, fig-2, kiwi-3],
    pairs_keys(Pairs, Keys), writeln(keys(Keys)),
    pairs_values(Pairs, Values), writeln(values(Values)),
    pairs_keys_values(Built, [a, b, c], [1, 2, 3]), writeln(built(Built)),
    transpose_pairs(Pairs, Transposed), writeln(transposed(Transposed)),

    % sort items by a computed key: decorate, keysort, undecorate
    Words = [banana, fig, apple, kiwi, date],
    findall(Len-W, (member(W, Words), atom_length(W, Len)), Decorated),
    keysort(Decorated, Sorted),
    pairs_values(Sorted, ByLength), writeln(by_length(ByLength)),

    % group values sharing a key
    transpose_pairs(Pairs, ByCount),
    group_pairs_by_key(ByCount, Groups), writeln(groups(Groups)),
    map_list_to_pairs(atom_length, Words, LP), writeln(map_list_to_pairs(LP)).
