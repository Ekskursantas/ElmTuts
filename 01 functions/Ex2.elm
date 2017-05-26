module Main exposing (..)

import Html
import String


main =
    checkName "tomas"


checkName name =
    let
        long =
            toString (String.length name)
    in
    if String.length name >= 10 then
        Html.text (String.toUpper name ++ " - is " ++ long ++ " long")
    else
        Html.text (String.toLower name ++ " - is " ++ long ++ " long")
