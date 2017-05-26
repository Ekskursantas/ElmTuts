module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


type alias Model =
    { calories : Int
    , input : Int
    , error : Maybe String
    }


initModel : Model
initModel =
    { calories = 0
    , input = 0
    , error = Nothing
    }


type Msg
    = CountCallories
    | Input String
    | Clear


update : Msg -> Model -> Model
update msg model =
    case msg of
        CountCallories ->
            { model
                | calories = model.calories + model.input
                , input = 0
            }

        Input number ->
            case String.toInt number of
                Ok number ->
                    { model
                        | input = number
                        , error = Nothing
                    }

                Err err ->
                    { model
                        | input = 0
                        , error = Just err
                    }

        Clear ->
            initModel


view : Model -> Html Msg
view model =
    div []
        [ h3 []
            [ text ("Calories: " ++ toString model.calories) ]
        , input
            [ type_ "text"
            , onInput Input
            , value
                (if model.input == 0 then
                    ""
                 else
                    toString model.input
                )
            ]
            []
        , div [] [ text (Maybe.withDefault "" model.error) ]
        , button
            [ type_ "button"
            , onClick CountCallories
            ]
            [ text "Add" ]
        , button
            [ type_ "button"
            , onClick Clear
            ]
            [ text "Clear" ]
        ]


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = initModel, view = view, update = update }
