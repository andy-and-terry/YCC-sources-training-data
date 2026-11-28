-module(affine_cipher).
-export([main/0]).

mod(X, M) -> ((X rem M) + M) rem M.

mod_inverse(A, M) -> hd([X || X <- lists:seq(1, M - 1), A * X rem M =:= 1]).

affine(S, A, B, Decrypt) ->
    Inv = mod_inverse(A, 26),
    [case Ch >= $A andalso Ch =< $Z of
         true ->
             X = Ch - $A,
             Y = case Decrypt of true -> mod(Inv * (X - B), 26); false -> (A * X + B) rem 26 end,
             Y + $A;
         false -> Ch
     end || Ch <- S].

main() ->
    C = affine("AFFINE", 5, 8, false),
    io:format("~s ~s~n", [C, affine(C, 5, 8, true)]).
