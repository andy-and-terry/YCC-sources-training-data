-module(anagram_check).
-export([is_anagram/2]).

normalize(Str) ->
    lists:sort([C || C <- string:to_lower(Str), C =/= $\s]).

is_anagram(A, B) -> normalize(A) =:= normalize(B).
