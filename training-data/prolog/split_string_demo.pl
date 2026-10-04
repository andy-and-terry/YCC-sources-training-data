:- initialization(main).

main :-
    split_string("alpha,beta,,gamma", ",", "", Parts),
    format("split: ~q~n", [Parts]),
    split_string("  padded text  ", "", " ", [Trimmed]),
    format("trimmed: ~q~n", [Trimmed]),
    split_string("a b  c", " ", "", WithEmpty),
    format("with empties: ~q~n", [WithEmpty]),
    split_string("/home//user/docs", "/", "", PathParts),
    exclude(==(""), PathParts, Clean),
    format("path parts: ~q~n", [Clean]),
    atomic_list_concat(Words, ' ', 'the quick brown fox'),
    format("words: ~w~n", [Words]),
    atomic_list_concat([a, b, c], '-', Joined),
    format("joined: ~w~n", [Joined]),
    atomic_list_concat([x, 1, "y"], Cat), format("concat: ~w~n", [Cat]),
    string_concat("foo", "bar", S), string_upper(S, U),
    format("~s~n", [[0'o, 0'k]]), format("~w ~w~n", [S, U]),
    sub_string("hello world", 6, 5, _, Sub), format("sub: ~w~n", [Sub]),
    ( sub_atom(hello, B, _, 0, llo) -> format("llo starts at ~w~n", [B]) ; true ),
    number_codes(N, "42"), atom_number('3.5', F), format("~w ~w~n", [N, F]),
    string_code(1, "A", Code), char_code(Ch, 0'z), format("~w ~w~n", [Code, Ch]),
    text_concat(abc, "def", T), format("text_concat: ~q~n", [T]).
