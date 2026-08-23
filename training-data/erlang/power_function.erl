-module(power_function).
-export([pow/2]).

pow(_Base, 0) -> 1;
pow(Base, Exp) when Exp rem 2 =:= 0 ->
    Half = pow(Base, Exp div 2),
    Half * Half;
pow(Base, Exp) -> Base * pow(Base, Exp - 1).
