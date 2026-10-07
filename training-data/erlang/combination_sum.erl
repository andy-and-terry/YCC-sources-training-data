-module(combination_sum).
-export([find/2]).

find(Candidates, Target) -> backtrack(Candidates, Target, []).

backtrack(_Candidates, 0, Current) -> [lists:reverse(Current)];
backtrack(_Candidates, Target, _Current) when Target < 0 -> [];
backtrack([], _Target, _Current) -> [];
backtrack([First | Rest] = Candidates, Target, Current) ->
    backtrack(Candidates, Target - First, [First | Current]) ++
        backtrack(Rest, Target, Current).
