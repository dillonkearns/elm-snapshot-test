module SnapshotTests exposing (..)

import GildedRose
import Permutations exposing (test)


all =
    [ test "example" <|
        \() ->
            Permutations.verifyCombinations3
                (\n s q ->
                    GildedRose.updateQuality [ GildedRose.createItem n s q ]
                )
                [ "", "Sulfuras, Hand of Ragnaros", "Aged Brie", "Backstage passes to a TAFKAL80ETC concert" ]
                (List.range -1 50)
                (List.range -1 50)
    ]
