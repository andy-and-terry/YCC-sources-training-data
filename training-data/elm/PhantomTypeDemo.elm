module PhantomTypeDemo exposing (Raw, Validated, Form, fromInput, submit, validate)


type Raw
    = Raw


type Validated
    = Validated


type Form state
    = Form String


fromInput : String -> Form Raw
fromInput text =
    Form text


validate : Form Raw -> Result String (Form Validated)
validate (Form text) =
    if String.length (String.trim text) >= 3 then
        Ok (Form (String.trim text))

    else
        Err "input too short"


submit : Form Validated -> String
submit (Form text) =
    "submitted: " ++ text


-- submit (fromInput "hi") is a compile error:
-- only a Form Validated can be passed to submit.
