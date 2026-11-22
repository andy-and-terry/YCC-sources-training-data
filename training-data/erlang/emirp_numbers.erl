-module(emirp_numbers).
-export([main/0]).

%% Emirps: primes whose digit reversal is a different prime.
is_prime(N) when N < 2 -> false;
is_prime(N) -> not lists:any(fun(D) -> N rem D =:= 0 end, lists:seq(2, trunc(math:sqrt(N)))).

is_emirp(N) ->
    R = list_to_integer(lists:reverse(integer_to_list(N))),
    R =/= N andalso is_prime(N) andalso is_prime(R).

main() ->
    L = [N || N <- lists:seq(2, 199), is_emirp(N)],
    io:format("~s~n", [string:join([integer_to_list(X) || X <- L], " ")]).
