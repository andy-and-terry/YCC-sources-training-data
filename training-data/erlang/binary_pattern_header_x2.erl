-module(binary_pattern_header_x2).
-export([parse/1]).

parse(<<Version:4, IHL:4, TOS:8, Len:16, _/binary>>) ->
    {Version, IHL, TOS, Len}.
