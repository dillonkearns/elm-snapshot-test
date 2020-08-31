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
                [ "", "Sulfuras, Hand of Ragnaros", "Aged Brie", "Backstage passes to a TAFKAL80ETC concert" ]
                [ 1, 6, 11 ]
                [ 0, 1, 48, 49 ]
    ]
