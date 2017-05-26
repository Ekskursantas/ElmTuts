module Main exposing (..)

import Html


type alias Items =
    { name : String
    , qty : Int
    , freeQty : Int
    }


cart : List Items
cart =
    [ { name = "Lemon", qty = 1, freeQty = 0 }
    , { name = "Apple", qty = 5, freeQty = 0 }
    , { name = "Pear", qty = 20, freeQty = 0 }
    ]


freqPrize : Int -> Int -> Items -> Items
freqPrize quantity qtFree thing =
    if qtFree > 0 && thing.freeQty == 0 then
        { thing
            | freeQty = thing.qty // quantity * qtFree
        }
    else
        thing


newCart : List Items
newCart =
    List.map (freqPrize 10 3 >> freqPrize 5 1) cart


main : Html.Html msg
main =
    newCart
        |> toString
        |> Html.text
