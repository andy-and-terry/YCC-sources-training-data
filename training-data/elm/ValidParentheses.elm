module ValidParentheses exposing (isValid)


isValid : String -> Bool
isValid str =
    case go (String.toList str) [] of
        [] ->
            True

        _ ->
            False


go : List Char -> List Char -> List Char
go chars stack =
    case chars of
        [] ->
            stack

        c :: rest ->
            case c of
                '(' ->
                    go rest ('(' :: stack)

                '[' ->
                    go rest ('[' :: stack)

                '{' ->
                    go rest ('{' :: stack)

                ')' ->
                    closeWith rest stack '(' |> Maybe.withDefault [ 'x' ] |> go rest

                ']' ->
                    closeWith rest stack '[' |> Maybe.withDefault [ 'x' ] |> go rest

                '}' ->
                    closeWith rest stack '{' |> Maybe.withDefault [ 'x' ] |> go rest

                _ ->
                    go rest stack


closeWith : List Char -> List Char -> Char -> Maybe (List Char)
closeWith _ stack expected =
    case stack of
        top :: rest ->
            if top == expected then
                Just rest

            else
                Nothing

        [] ->
            Nothing
