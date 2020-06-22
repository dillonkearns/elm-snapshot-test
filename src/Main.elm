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
        [ "Aged Brie", "Sulfuras, Hand of Ragnaros", "Not a special item", "Backstage passes to a TAFKAL80ETC concert" ]
        [ -1, 0, 6, 11, 12, 13 ]
        [ 0, 1, 48, 49, 50 ]
