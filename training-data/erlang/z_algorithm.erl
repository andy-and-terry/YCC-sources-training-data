-module(z_algorithm).
-export([z_array/1, search/2]).

z_array(S) ->
    N = length(S),
    Arr = list_to_tuple(S),
    Z0 = list_to_tuple(lists:duplicate(N, 0)),
    {_, _, Z} = lists:foldl(fun(I, Acc) -> extend(Arr, N, I, Acc) end, {0, 0, Z0}, lists:seq(1, N - 1)),
    Z.

extend(Arr, N, I, {L, R, Z}) ->
    Z1 =
        case I < R of
            true -> setelement(I + 1, Z, min(R - I, element(I - L + 1, Z)));
            false -> setelement(I + 1, Z, 0)
        end,
    {L1, R1, Z2} = match(Arr, N, I, L, R, Z1),
    case I + element(I + 1, Z2) > R1 of
        true -> {I, I + element(I + 1, Z2), Z2};
        false -> {L1, R1, Z2}
    end.

match(Arr, N, I, L, R, Z) ->
    Zi = element(I + 1, Z),
    case I + Zi < N andalso element(Zi + 1, Arr) =:= element(I + Zi + 1, Arr) of
        true -> match(Arr, N, I, L, R, setelement(I + 1, Z, Zi + 1));
        false -> {L, R, Z}
    end.

search(Text, Pattern) ->
    Combined = Pattern ++ "$" ++ Text,
    Z = z_array(Combined),
    M = length(Pattern),
    ZList = tuple_to_list(Z),
    [Index - M - 1 || {Value, Index} <- lists:zip(ZList, lists:seq(0, length(ZList) - 1)), Value =:= M].
