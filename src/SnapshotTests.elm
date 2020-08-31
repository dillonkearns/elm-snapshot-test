module SnapshotTests exposing (..)

import GildedRose
import Permutations exposing (test)


all =
    [ test "example" <|
        \() ->
            Permutations.verifyCombinations3
                (\name sellIn quality ->
                    GildedRose.updateQuality [ GildedRose.Item name sellIn quality ]
                )
                [ "", "Sulfuras, Hand of Ragnaros" ]
                [ 1 ]
                [ 0, 1 ]
    ]
