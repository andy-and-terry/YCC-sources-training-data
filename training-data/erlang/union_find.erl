-module(union_find).
-export([new/1, find/2, union/3]).

new(N) -> maps:from_list([{I, I} || I <- lists:seq(0, N - 1)]).

find(Parents, X) ->
    case maps:get(X, Parents) of
        X -> X;
        Parent -> find(Parents, Parent)
    end.

union(Parents, X, Y) ->
    RootX = find(Parents, X),
    RootY = find(Parents, Y),
    case RootX =:= RootY of
        true -> Parents;
        false -> maps:put(RootX, RootY, Parents)
    end.
