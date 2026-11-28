-module(pollard_rho).
-export([main/0]).

gcd(A, 0) -> A;
gcd(A, B) -> gcd(B, A rem B).

rho(N) when N rem 2 =:= 0 -> 2;
rho(N) -> rho(2, 2, N).

rho(X, Y, N) ->
    F = fun(V) -> (V * V + 1) rem N end,
    X1 = F(X), Y1 = F(F(Y)),
    case gcd(abs(X1 - Y1), N) of
        1 -> rho(X1, Y1, N);
        D -> D
    end.

main() ->
    N = 8051, P = rho(N),
    io:format("~p = ~p * ~p~n", [N, P, N div P]).
