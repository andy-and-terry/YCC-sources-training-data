-module(lychrel_steps).
-export([main/0]).

%% Reverse-and-add until a palindrome; count the steps.
rev(N) -> list_to_integer(lists:reverse(integer_to_list(N))).

steps(N) -> steps(N, 0).

steps(_, 100) -> -1;
steps(N, Count) ->
    case Count > 0 andalso N =:= rev(N) of
        true -> Count;
        false -> steps(N + rev(N), Count + 1)
    end.

main() ->
    Out = [steps(N) || N <- [56, 57, 59, 79, 89]],
    io:format("~s~n", [string:join([integer_to_list(S) || S <- Out], " ")]).
