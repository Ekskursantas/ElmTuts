module Main exposing (..)

import Html
import String


(~=) firstString secondString =
    let
        firstStringLetter =
            String.left 1 firstString

        secondStringLetter =
            String.left 1 secondString
    in
    firstStringLetter == secondStringLetter


main =
    "Zygimantas"
        ~= "Zenito"
        |> toString
        |> Html.text
