port module Main exposing (..)

import Json.Encode as Encode
import SnapshotTests


port snapshot : List { name : String, value : Encode.Value } -> Cmd msg


main =
    Platform.worker
        { init = \() -> ( (), snapshot SnapshotTests.all )
        , update = \msg model -> ( model, Cmd.none )
        , subscriptions = \model -> Sub.none
        }
