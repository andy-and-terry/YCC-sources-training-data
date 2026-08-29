word_frequency(Text, Freq) :-
    string_lower(Text, Lower),
    split_string(Lower, " ", "", Words),
    msort(Words, Sorted),
    count_words(Sorted, Freq).

count_words([], []).
count_words([W|Ws], [W-Count|Rest]) :-
    partition([X]>>(X == W), [W|Ws], Same, Different),
    length(Same, Count),
    count_words(Different, Rest).

:- word_frequency("the quick brown fox the lazy fox", Freq), writeln(Freq).
