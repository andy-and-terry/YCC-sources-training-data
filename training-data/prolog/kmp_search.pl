substring_at(Text, Pattern, Index) :-
    string_length(Pattern, PLen),
    string_length(Text, TLen),
    MaxStart is TLen - PLen,
    between(0, MaxStart, Index),
    sub_string(Text, Index, PLen, _, Pattern), !.

:- (substring_at("abxabcabcaby", "abcaby", Idx) -> writeln(Idx) ; writeln(-1)).
