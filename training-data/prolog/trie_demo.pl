:- dynamic(trie_word/1).

add_word(Word) :- assertz(trie_word(Word)).

has_prefix(Prefix) :-
    trie_word(Word),
    sub_atom(Word, 0, _, _, Prefix), !.

:- add_word(cat), add_word(car),
   (trie_word(cat) -> writeln(true) ; writeln(false)),
   (has_prefix(ca) -> writeln(true) ; writeln(false)).
