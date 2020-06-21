port module Main exposing (..)

import Json.Encode as Encode
import Permutations


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


main =
    Platform.worker
        { init =
            \() ->
                ( Model
                , snapshot
                    { name = "example1"
                    , value =
                        Permutations.approve2 (\a b -> score ( a, b )) [ 0, 1, 2, 3, 4, 5 ] [ 0, 1, 2, 3, 4, 5 ]
                    }
                )
        , update = \msg model -> ( model, Cmd.none )
        , subscriptions = \model -> Sub.none
        }
