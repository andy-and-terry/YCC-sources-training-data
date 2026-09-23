module FormValidationResult exposing (ValidatedUser, validateAge, validateName, validateUser)


type alias ValidatedUser =
    { name : String
    , age : Int
    }


validateName : String -> Result String String
validateName name =
    if String.isEmpty name then
        Err "name cannot be empty"

    else
        Ok name


validateAge : Int -> Result String Int
validateAge age =
    if age < 0 || age > 150 then
        Err "age must be between 0 and 150"

    else
        Ok age


validateUser : String -> Int -> Result (List String) ValidatedUser
validateUser name age =
    case ( validateName name, validateAge age ) of
        ( Ok validName, Ok validAge ) ->
            Ok { name = validName, age = validAge }

        ( nameResult, ageResult ) ->
            Err
                (List.filterMap identity
                    [ resultToError nameResult
                    , resultToError ageResult
                    ]
                )


resultToError : Result String a -> Maybe String
resultToError result =
    case result of
        Err message ->
            Just message

        Ok _ ->
            Nothing
