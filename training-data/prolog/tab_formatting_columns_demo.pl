row(apple, 3, 1.5).
row(watermelon, 12, 0.25).
row(fig, 100, 12.125).

:- forall(row(Name, Qty, Price),
          format("~w~t~12|~t~d~5+~t~2f~10+~n", [Name, Qty, Price])).

:- format("~`-t~30|~n").
:- format("~t~w~10|~w~n", [right, ' <-']).
:- format("~w~t~10|~w~n", [left, ' <-']).
:- format("~t~w~t~20|~n", [centered]).
:- format("~a~t~a~20|~a~n", [start, end, '!']).
:- format("~e ~4e ~g~n", [1234.5, 1234.5, 0.5]).
:- format("~D~n", [1234567]).
:- format("~8|abc~n").
