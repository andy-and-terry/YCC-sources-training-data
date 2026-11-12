digits([D|T]) --> digit(D), digits(T).
digits([D]) --> digit(D).
digit(D) --> [D], { code_type(D, digit) }.
:- initialization(main).
main :- phrase(digits(Cs), `1234`), atom_codes(A, Cs), writeln(A).
