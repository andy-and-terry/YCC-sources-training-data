-module(mandelbrot_ascii).
-export([main/0]).

escape(Cr, Ci) -> escape(0.0, 0.0, Cr, Ci, 0).
escape(_, _, _, _, 30) -> 30;
escape(Zr, Zi, _, _, N) when Zr * Zr + Zi * Zi >= 4 -> N;
escape(Zr, Zi, Cr, Ci, N) -> escape(Zr * Zr - Zi * Zi + Cr, 2 * Zr * Zi + Ci, Cr, Ci, N + 1).

main() ->
    [io:format("~s~n", [[case escape(X / 20, Y / 5) of 30 -> $#; _ -> $. end || X <- lists:seq(-40, 12)]])
     || Y <- lists:seq(-5, 5)].
