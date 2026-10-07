-module(modular_exponentiation).
-export([mod_pow/3]).

mod_pow(_Base, 0, _Modulus) -> 1;
mod_pow(Base, Exponent, Modulus) when Exponent rem 2 =:= 0 ->
    Half = mod_pow(Base, Exponent div 2, Modulus),
    (Half * Half) rem Modulus;
mod_pow(Base, Exponent, Modulus) ->
    (Base rem Modulus) * mod_pow(Base, Exponent - 1, Modulus) rem Modulus.
