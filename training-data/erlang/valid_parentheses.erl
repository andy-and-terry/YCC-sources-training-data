-module(valid_parentheses).
-export([is_valid/1]).

is_valid(Str) -> check(Str, []).

check([], []) -> true;
check([], _) -> false;
check([C | Rest], Stack) when C =:= $(; C =:= $[; C =:= ${ ->
    check(Rest, [C | Stack]);
check([C | Rest], [Top | StackRest]) when
    (C =:= $)) and (Top =:= $()
    orelse (C =:= $]) and (Top =:= $[)
    orelse (C =:= $}) and (Top =:= ${)
->
    check(Rest, StackRest);
check(_, _) -> false.
