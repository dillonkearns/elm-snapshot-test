module SnapshotTests exposing (..)

import GildedRose exposing (Item)
import Permutations exposing (test)


all =
    [ test "example" <|
        \() ->
            Permutations.verifyCombinations3
                (\name sellIn quality ->
                    let
                        item =
                            GildedRose.Item name sellIn quality
                    in
                    GildedRose.updateQuality [ item ]
                )
                [ "", "Sulfuras, Hand of Ragnaros", "Aged Brie", "Backstage passes to a TAFKAL80ETC concert" ]
                (List.range -1 50)
                (List.range -1 50)
    ]
