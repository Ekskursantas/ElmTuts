module Main exposing (..)

import Html


cart =
    [ { name = "Lemon", qty = 1, freeQty = 0 }
    , { name = "Apple", qty = 5, freeQty = 0 }
    , { name = "Pear", qty = 20, freeQty = 0 }
    ]


free minQty freeQty item =
    if item.freeQty == 0 && minQty > 0 then
        { item | freeQty = item.qty // minQty * freeQty }
    else
        item


main =
    List.map (free 5 1 >> free 10 3) cart
        |> toString
        |> Html.text
