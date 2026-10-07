% Classifying characters with char_type/2 and code_type/2.
:- ( char_type(a, alpha) -> writeln(alpha) ; true ).
:- ( char_type('7', digit(W)) -> writeln(W) ; true ).
:- upcase_atom('hello world', U), writeln(U).
:- atom_chars(hello, Cs), include([C]>>char_type(C, alpha), Cs, As), length(As, N), writeln(N).
:- atom_codes(abc, Codes), maplist([C, D]>>(D is C + 1), Codes, Next), atom_codes(A, Next), writeln(A).
:- forall(member(C, [' ', a, '1', '.']),
          ( findall(T, (member(T, [space, alpha, digit(_), punct]), char_type(C, T)), Ts),
            format("~q: ~w~n", [C, Ts]) )).
