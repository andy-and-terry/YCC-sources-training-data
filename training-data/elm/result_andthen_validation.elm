module Main exposing (main)
import Html exposing (text)

positive : Int -> Result String Int
positive n = if n > 0 then Ok n else Err "not positive"

main =
    text (case String.toInt "5" |> Result.fromMaybe "nan" |> Result.andThen positive of
        Ok n -> "ok " ++ String.fromInt n
        Err e -> e)
