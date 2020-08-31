module SnapshotTests exposing (..)

import GildedRose
import Permutations


all =
    [ test "example1" <|
        \() ->
            Permutations.verifyCombinations3 (\a b c -> GildedRose.updateQuality [ GildedRose.Item a b c ])
                [ "Aged Brie", "Sulfuras, Hand of Ragnaros", "Not a special item", "Backstage passes to a TAFKAL80ETC concert" ]
                [ -1, 0, 6, 11, 12, 13, 14, 15, 16 ]
                [ 0, 1, 48, 49, 50, 51 ]
    , test "example2" <|
        \() ->
            Permutations.verify3 (\a b c -> GildedRose.updateQuality [ GildedRose.Item a b c ])
                ""
                0
                0
    ]


test name getVerification =
    { name = name
    , value = getVerification ()
    }
