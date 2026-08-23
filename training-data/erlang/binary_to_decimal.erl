-module(binary_to_decimal).
-export([convert/1]).

convert(BinaryStr) -> list_to_integer(BinaryStr, 2).
