port module Main exposing (..)

import Dict


port snapshot : { name : String, value : String } -> Cmd msg


type Model
    = Model


init : Float
init =
    0


tennisScores : Dict.Dict ( Int, Int ) String
tennisScores =
    Dict.fromList
        [ ( ( 1, 0 ), "15-Love" )
        ]


main =
    Platform.worker
        { init =
            \() ->
                ( Model
                , snapshot
                    { name = "example1"
                    , value = Debug.toString tennisScores
                    }
                )
        , update = \msg model -> ( model, Cmd.none )
        , subscriptions = \model -> Sub.none
        }
