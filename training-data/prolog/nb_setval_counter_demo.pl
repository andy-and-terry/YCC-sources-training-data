:- initialization(main).

tick :- nb_getval(counter, C), C1 is C + 1, nb_setval(counter, C1).

main :-
    nb_setval(counter, 0),
    forall(between(1, 5, _), tick),
    nb_getval(counter, V), format("counter = ~w~n", [V]),
    b_setval(temp, 10), b_getval(temp, T), writeln(T).
