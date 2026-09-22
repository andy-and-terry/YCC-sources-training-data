-module(miller_rabin).
-export([is_prime/1]).

mod_pow(_Base, 0, _Modulus) -> 1;
mod_pow(Base, Exp, Modulus) when Exp rem 2 =:= 0 ->
    Half = mod_pow(Base, Exp div 2, Modulus),
    (Half * Half) rem Modulus;
mod_pow(Base, Exp, Modulus) ->
    (Base * mod_pow(Base, Exp - 1, Modulus)) rem Modulus.

decompose(D, R) when D rem 2 =:= 0 -> decompose(D div 2, R + 1);
decompose(D, R) -> {D, R}.

repeat_square(_X, _N, Times) when Times =< 0 -> false;
repeat_square(X, N, Times) ->
    X1 = (X * X) rem N,
    case X1 =:= N - 1 of
        true -> true;
        false -> repeat_square(X1, N, Times - 1)
    end.

is_witness(N, D, R, W) ->
    X0 = mod_pow(W, D, N),
    case X0 =:= 1 orelse X0 =:= N - 1 of
        true -> false;
        false -> not repeat_square(X0, N, R - 1)
    end.

is_prime(N) when N < 2 -> false;
is_prime(N) when N =:= 2; N =:= 3 -> true;
is_prime(N) when N rem 2 =:= 0 -> false;
is_prime(N) ->
    {D, R} = decompose(N - 1, 0),
    Witnesses = [W || W <- [2, 3, 5, 7, 11, 13], W < N],
    not lists:any(fun(W) -> is_witness(N, D, R, W) end, Witnesses).
