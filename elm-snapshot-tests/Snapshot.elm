port module Snapshot exposing (..)


port snapshot : { name : String, value : String } -> Cmd msg


type Model
    = Model


main =
    Platform.worker
        { init =
            \() ->
                ( Model
                , snapshot
                    { name = "example1"
                    , value = "abcdefg"
                    }
                )
        , update = \msg model -> ( model, Cmd.none )
        , subscriptions = \model -> Sub.none
        }
