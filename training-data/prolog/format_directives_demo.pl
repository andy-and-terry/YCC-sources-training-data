:- initialization(main).

main :-
    format("integer: ~d, float: ~2f, exp: ~e~n", [42, 3.14159, 1234.5]),
    format("string: ~s, atom: ~a, term: ~w, quoted: ~q~n", [[104, 105], hello, 'A b', 'A b']),
    format("with commas: ~D~n", [1234567]),
    format("radix: ~8r ~16r ~16R~n", [64, 255, 255]),
    format("padding: [~t~w~10|] [~w~t~10|] [~t~w~t~10|]~n", [right, left, mid]),
    format("column table:~n"),
    forall(member(Name-Qty, [apples-3, kiwis-12, bananas-150]),
           format("  ~w~t~10|~t~d~5+~n", [Name, Qty])),
    format("char codes: ~c~c~c~n", [80, 108, 33]),
    format("repeat: ~`-t~30|~n"),
    format("ignore arg: ~i~w~n", [skipped, shown]),
    format("tilde: ~~ and newline count~n~*c~n", [3, 0'*]),
    format(atom(A), "~w-~w", [a, b]), writeln(A),
    with_output_to(string(S), (write(x), write(y))), string_length(S, Len),
    format("captured ~s (~d chars)~n", [[0'x, 0'y], Len]).
