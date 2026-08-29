roman_value(1000, 'M'). roman_value(900, 'CM'). roman_value(500, 'D').
roman_value(400, 'CD'). roman_value(100, 'C'). roman_value(90, 'XC').
roman_value(50, 'L'). roman_value(40, 'XL'). roman_value(10, 'X').
roman_value(9, 'IX'). roman_value(5, 'V'). roman_value(4, 'IV'). roman_value(1, 'I').

to_roman(0, '') :- !.
to_roman(N, Roman) :-
    roman_value(Value, Symbol),
    Value =< N, !,
    N1 is N - Value,
    to_roman(N1, Rest),
    atom_concat(Symbol, Rest, Roman).

:- to_roman(1994, Roman), writeln(Roman).
