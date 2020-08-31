module SnapshotTests exposing (..)

import GildedRose
import Permutations exposing (test)


all =
    [ test "example" <|
        \() ->
            Permutations.verifyCombinations3 (\name b c -> GildedRose.updateQuality [ GildedRose.Item name b c ])
                [ "", "Sulfuras, Hand of Ragnaros" ]
                [ 1 ]
                [ 0 ]
    ]
