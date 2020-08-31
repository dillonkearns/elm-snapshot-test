module SnapshotTests exposing (..)

import GildedRose exposing (Item)
import Permutations exposing (test)


createItem : String -> Int -> Int -> Item
createItem name sellIn quality =
    GildedRose.Item name sellIn quality


all =
    [ test "example" <|
        \() ->
            Permutations.verifyCombinations3
                (\name sellIn quality ->
                    GildedRose.updateQuality [ GildedRose.Item name sellIn quality ]
                )
                [ "", "Sulfuras, Hand of Ragnaros", "Aged Brie", "Backstage passes to a TAFKAL80ETC concert" ]
                (List.range -1 50)
                (List.range -1 50)
    ]
