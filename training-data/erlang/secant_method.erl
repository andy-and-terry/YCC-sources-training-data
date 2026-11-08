-module(secant_method).
-export([main/0]).

secant(_F, _A, B, 0) -> B;
secant(F, A, B, N) ->
    FA = F(A), FB = F(B),
    case FB == FA of
        true -> B;
        false -> secant(F, B, B - FB * (B - A) / (FB - FA), N - 1)
    end.

main() -> io:format("~.8f~n", [secant(fun(X) -> X * X - 2 end, 1.0, 2.0, 40)]).
