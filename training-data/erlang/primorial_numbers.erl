%% Primorials up to 1e6, including 1; expect 8.
-module(primorial_numbers).
-export([main/0]).

is_prime(N) when N < 2 -> false;
is_prime(N) -> is_prime(N, 2).
is_prime(N, D) when D * D > N -> true;
is_prime(N, D) when N rem D =:= 0 -> false;
is_prime(N, D) -> is_prime(N, D + 1).
build(P, Acc, Out) ->
    case is_prime(P) of
        false -> build(P + 1, Acc, Out);
        true ->
            New = Acc * P,
            if New > 1000000 -> lists:reverse(Out);
               true -> build(P + 1, New, [New | Out])
            end
    end.

main() ->
    V = build(2, 1, [1]),
    io:format("~p ~p~n", [length(V), V]).
