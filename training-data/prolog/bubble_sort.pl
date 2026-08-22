swap([X, Y | Rest], [Y, X | Rest]) :- X > Y, !.
swap([X | Rest], [X | NewRest]) :- swap(Rest, NewRest).

bubble_pass(List, List) :- \+ swap(List, _).
bubble_pass(List, Sorted) :-
    swap(List, Swapped),
    bubble_pass(Swapped, Sorted).

:- bubble_pass([5,2,9,1,5,6], Sorted), writeln(Sorted).
