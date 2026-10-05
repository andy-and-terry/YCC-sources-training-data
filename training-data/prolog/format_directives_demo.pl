:- format("Hello, ~w!~n", [world]).
:- format("~a and ~q~n", [abc, 'Needs Quotes']).
:- format("~d items, ~2f avg, ~e sci~n", [42, 3.14159, 1234.5]).
:- format("~t~w~10||~n", [right]).
:- format("~w~t~10||~n", [left]).
:- format("~t~w~t~10||~n", [mid]).
:- format("~s~n", [[104, 105]]).
:- format("~8|abc~n", []).
:- format("~`-t~30|~n").
:- format("~D~n", [1234567]).
:- format("~2d~n", [314]).
:- format("~p ~i~w~n", [foo, skipped, shown]).
:- format("~c~c~n", [72, 105]).
:- format(atom(A), "~w-~w", [a, b]), writeln(A).
:- with_output_to(string(S), (write(x), write(y))), string_length(S, L), writeln(S-L).
