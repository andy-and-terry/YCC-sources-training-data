-module(thue_morse_sequence).
-export([main/0]).

%% Thue-Morse: t(n) is the parity of the number of 1 bits in n
parity(0) -> 0;
parity(N) -> (N band 1) bxor parity(N bsr 1).

main() ->
    io:format("~s~n", [[$0 + parity(N) || N <- lists:seq(0, 31)]]).
