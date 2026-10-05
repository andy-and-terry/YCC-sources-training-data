:- findall(X, between(1, 5, X), L), writeln(L).
:- between(1, inf, X), X * X > 50, !, writeln(X).
:- succ(X, 5), succ(5, Y), writeln(X-Y).
:- plus(2, X, 7), writeln(X).
:- X is max(3, 7) + min(2, 9), writeln(X).
:- X is 17 mod 5, Y is -17 mod 5, Z is -17 rem 5, writeln([X, Y, Z]).
:- X is 7 // 2, Y is -7 // 2, Z is -7 div 2, writeln([X, Y, Z]).
:- X is 2 ** 10, Y is 2 ^ 100, writeln(X-Y).
:- X is truncate(3.7), Y is round(3.5), Z is ceiling(3.2), writeln([X, Y, Z]).
:- X is gcd(48, 18), Y is msb(1024), writeln(X-Y).
:- X is pi, format("~4f~n", [X]).
:- catch(succ(_, _), error(Err, _), (writeln(Err))).
