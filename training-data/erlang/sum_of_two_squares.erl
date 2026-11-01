-module(sum_of_two_squares).
-export([main/0]).

%% Positive N expressible as A*A + B*B with A, B >= 0.
representable(N) ->
    lists:any(fun(A) ->
        A * A =< N andalso begin
            B = round(math:sqrt(N - A * A)),
            A * A + B * B =:= N
        end
    end, lists:seq(0, N)).

main() ->
    Out = [N || N <- lists:seq(1, 30), representable(N)],
    io:format("~s~n", [string:join([integer_to_list(N) || N <- Out], " ")]).
