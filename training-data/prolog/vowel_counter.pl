vowel(V) :- member(V, [a, e, i, o, u]).

count_vowel(V, Chars, N) :- include(==(V), Chars, Hits), length(Hits, N).

count_vowels(Text, Counts) :-
    string_lower(Text, Lower),
    string_chars(Lower, Chars),
    findall(V-N, (vowel(V), count_vowel(V, Chars, N)), Counts).

:- count_vowels("Education is beautiful", C), writeln(C).
