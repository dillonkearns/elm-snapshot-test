port module Main exposing (..)

import Json.Encode as Encode
import SnapshotTests


port snapshot : List { name : String, value : Encode.Value } -> Cmd msg


type alias SnapshotValue =
    { name : String, value : Encode.Value }


main =
    Platform.worker
        { init = \() -> ( (), snapshot SnapshotTests.all )
        , update = \msg model -> ( model, Cmd.none )
        , subscriptions = \model -> Sub.none
        }


test : String -> (() -> Encode.Value) -> SnapshotValue
test name getVerification =
    { name = name
    , value = getVerification ()
    }
