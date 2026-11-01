-module(mian_chowla_sequence).
-export([main/0]).

%% Greedy sequence whose pairwise sums are all distinct.
build(Seq, _Sums, _Cand) when length(Seq) =:= 8 -> Seq;
build(Seq, Sums, Cand) ->
    Fresh = [X + Cand || X <- Seq ++ [Cand]],
    Distinct = length(Fresh) =:= length(lists:usort(Fresh)),
    Clash = lists:any(fun(S) -> lists:member(S, Sums) end, Fresh),
    case Distinct andalso not Clash of
        true -> build(Seq ++ [Cand], Sums ++ Fresh, Cand + 1);
        false -> build(Seq, Sums, Cand + 1)
    end.

main() ->
    Seq = build([], [], 1),
    io:format("~s~n", [string:join([integer_to_list(X) || X <- Seq], " ")]).
