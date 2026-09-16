subsequence([], []).
subsequence([H|T], [H|Rest]) :- subsequence(T, Rest).
subsequence([_|T], Rest) :- subsequence(T, Rest).

is_increasing([_]).
is_increasing([X, Y|Rest]) :- X < Y, is_increasing([Y|Rest]).

all_subsequence_lengths(List, Lengths) :-
    findall(SubLen,
            ( subsequence(List, Sub), Sub \= [], is_increasing(Sub), length(Sub, SubLen) ),
            Lengths).

longest_increasing_subsequence(List, Best) :-
    all_subsequence_lengths(List, Lengths),
    max_list(Lengths, Best).

:- longest_increasing_subsequence([10, 9, 2, 5, 3, 7, 101, 18], Best),
   writeln(Best).
