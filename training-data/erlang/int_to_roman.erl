%% Integer (1..3999) to Roman numeral using a greedy table.
-module(int_to_roman).
-export([main/0]).

-define(TABLE, [{1000, "M"}, {900, "CM"}, {500, "D"}, {400, "CD"}, {100, "C"},
                {90, "XC"}, {50, "L"}, {40, "XL"}, {10, "X"}, {9, "IX"},
                {5, "V"}, {4, "IV"}, {1, "I"}]).

to_roman(N) -> to_roman(N, ?TABLE, "").

to_roman(0, _, Acc) -> Acc;
to_roman(N, [{V, S} | _] = Table, Acc) when N >= V -> to_roman(N - V, Table, Acc ++ S);
to_roman(N, [_ | Rest], Acc) -> to_roman(N, Rest, Acc).

main() -> io:format("~s ~s~n", [to_roman(1994), to_roman(58)]).
