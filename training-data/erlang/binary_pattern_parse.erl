-module(binary_pattern_parse).
-export([header/1]).

header(<<Version:4, Len:12, Rest/binary>>) -> {Version, Len, Rest}.
