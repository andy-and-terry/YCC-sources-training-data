:- format("~a and ~w~n", [atom, 'quoted atom']).
:- format("~q~n", ['needs quotes']).
:- format("~d ~D~n", [1234567, 1234567]).
:- format("~2f ~e~n", [3.14159, 31415.9]).
:- format("~s~n", [[104, 105]]).
:- format("~t~w~10||~n", [right]).
:- format("~w~t~10||~n", [left]).
:- format("~t~w~t~10||~n", [mid]).
:- format("~`-t~30|~n").
:- format("~8|abc~n").
:- format("~c~c~n", [72, 105]).
:- format("~i~w~n", [skipped, shown]).
:- format("~8r ~16r ~8R ~16R~n", [64, 255, 64, 255]).
:- format("~p~n", [foo(bar)]).
:- format(atom(A), "~w-~w", [a, b]), writeln(A).
