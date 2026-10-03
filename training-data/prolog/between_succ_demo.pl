% between/3 for bounded generate-and-test, and succ/2 / plus/3 for
% reversible arithmetic on natural numbers (each argument can be the
% unbound one, unlike plain `is`).
sum_of_squares(N, Sum) :-
    findall(Sq, (between(1, N, I), Sq is I * I), Squares),
    sum_list(Squares, Sum).

:- sum_of_squares(5, Sum), writeln(Sum).

:- succ(4, Five), writeln(Five).
:- succ(Four, 5), writeln(Four).

:- plus(2, 3, Sum), writeln(Sum).
:- plus(2, Y, 7), writeln(Y).
:- plus(X, 3, 7), writeln(X).

:- findall(N, (between(1, 20, N), 0 =:= N mod 3, 0 =:= N mod 5), FizzBuzzNums),
   writeln(FizzBuzzNums).
