module NestedRecordUpdate exposing (Address, User, moveTo, rename)


type alias Address =
    { city : String
    , zip : String
    }


type alias User =
    { name : String
    , address : Address
    }


rename : String -> User -> User
rename newName user =
    { user | name = newName }


moveTo : String -> String -> User -> User
moveTo city zip user =
    let
        addr =
            user.address
    in
    { user | address = { addr | city = city, zip = zip } }
