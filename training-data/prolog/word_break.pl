word(cat). word(cats). word(and). word(sand). word(dog).

segment([], []).
segment(Chars, [Word|Rest]) :-
    append(WordChars, RestChars, Chars),
    WordChars \= [],
    atom_chars(Word, WordChars),
    word(Word),
    segment(RestChars, Rest).

word_break(Atom, Words) :-
    atom_chars(Atom, Chars),
    segment(Chars, Words).

:- word_break(catsanddog, Words), writeln(Words).
:- (word_break(catsandwolf, Words) -> writeln(Words) ; writeln(no_segmentation)).
