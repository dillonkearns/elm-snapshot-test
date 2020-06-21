port module Main exposing (..)

import Dict
import Json.Encode as Encode


port snapshot : { name : String, value : Encode.Value } -> Cmd msg


type Model
    = Model


init : Int
init =
    0


type alias Game =
    ( Int, Int )


score : Game -> String
score ( player1, player2 ) =
    if player1 > 3 then
        if player1 > (player2 + 1) then
            "Player 1 wins!"

        else
            "Ad player 1"

    else if player1 == player2 then
        playerScoreToString player1 ++ " all"

    else
        playerScoreToString player1
            ++ "-"
            ++ playerScoreToString player2


playerScoreToString : Int -> String
playerScoreToString playerScore =
    case playerScore of
        1 ->
            "15"

        2 ->
            "30"

        3 ->
            "40"

        _ ->
            "Love"


testCases : List Game
testCases =
    [ ( 0, 0 )
    , ( 1, 0 )
    , ( 2, 0 )
    , ( 3, 0 )
    , ( 0, 1 )
    , ( 1, 1 )
    , ( 2, 1 )
    , ( 3, 1 )
    , ( 4, 1 )
    , ( 5, 4 )
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
                    , value = Debug.toString tennisScores |> Encode.string
                    }
                )
        , update = \msg model -> ( model, Cmd.none )
        , subscriptions = \model -> Sub.none
        }
