port module Main exposing (..)

import Dict


port snapshot : { name : String, value : String } -> Cmd msg


type Model
    = Model


init : Int
init =
    0


score : ( Int, Int ) -> String
score ( player1, player2 ) =
    "15-Love"


testCases =
    [ ( 1, 0 )
    ]


tennisScores : Dict.Dict ( Int, Int ) String
tennisScores =
    testCases
        |> List.map (\scores -> ( scores, score scores ))
        |> Dict.fromList


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
