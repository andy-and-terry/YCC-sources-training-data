-module(binary_header_parser).
-export([parse_header/1]).

parse_header(<<Version:8, Type:8, Length:16, Payload:Length/binary, Rest/binary>>) ->
    {ok, #{version => Version, type => Type, length => Length, payload => Payload}, Rest};
parse_header(_Other) ->
    {error, invalid_header}.
