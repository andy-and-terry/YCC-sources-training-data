:- initialization(main).

main :-
    format("~w and ~q~n", ['A b', 'A b']),
    format("~a~t~15|~a~n", [name, value]),
    format("~t~w~10|~n", [right]),
    format("~2f ~e~n", [3.14159, 1234.5]),
    format("~d ~D~n", [42, 1234567]),
    format("~s~n", [[104, 105]]),
    format("~p ~i~w~n", [foo, skipped, shown]),
    format("~*c~n", [5, 0'*]).
