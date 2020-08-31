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
                , Cmd.batch all
                )
        , update = \msg model -> ( model, Cmd.none )
        , subscriptions = \model -> Sub.none
        }


all =
    [ test "example1" <|
        \() ->
            Permutations.verifyCombinations3 (\a b c -> GildedRose.updateQuality [ GildedRose.Item a b c ])
                [ "Aged Brie", "Sulfuras, Hand of Ragnaros", "Not a special item", "Backstage passes to a TAFKAL80ETC concert" ]
                [ -1, 0, 6, 11, 12, 13, 14, 15 ]
                [ 0, 1, 48, 49, 50, 51 ]
    ]


test name getVerification =
    snapshot
        { name = name
        , value = getVerification ()
        }
