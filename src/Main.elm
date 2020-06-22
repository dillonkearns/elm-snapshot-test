port module Main exposing (..)

import GildedRose
import Json.Encode as Encode
import Permutations


port snapshot : { name : String, value : Encode.Value } -> Cmd msg


main =
    Platform.worker
        { init =
            \() ->
                ( ()
                , snapshot
                    { name = "example1"
                    , value = doPermutations ()
                    }
                )
        , update = \msg model -> ( model, Cmd.none )
        , subscriptions = \model -> Sub.none
        }


doPermutations () =
    Permutations.approve3 (\a b c -> GildedRose.updateQuality [ GildedRose.Item a b c ])
        [ "Aged Brie", "Sulfuras, Hand of Ragnaros" ]
        [ 0 ]
        [ 0 ]
