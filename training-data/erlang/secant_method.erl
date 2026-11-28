-module(secant_method).
-export([main/0, secant/4]).

secant(_F, _X0, X1, 0) -> X1;
secant(F, X0, X1, N) ->
    F0 = F(X0),
    F1 = F(X1),
    if
        F1 == F0 -> X1;
        true ->
            Next = X1 - F1 * (X1 - X0) / (F1 - F0),
            case abs(Next - X1) < 1.0e-12 of
                true -> Next;
                false -> secant(F, X1, Next, N - 1)
            end
    end.

main() ->
    io:format("~.10f~n", [secant(fun(X) -> X * X - 2 end, 1.0, 2.0, 50)]).
