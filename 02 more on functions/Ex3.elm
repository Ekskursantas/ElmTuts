module Main exposing (..)

import Html
import List
import String


wordCount =
    String.words >> List.length


main =
    wordCount "Mano vardas yra zygimantas pranka ir as dabar dirbu su elm"
        |> toString
        |> Html.text
