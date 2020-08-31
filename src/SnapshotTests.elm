module SnapshotTests exposing (..)

import GildedRose exposing (Item)
import Permutations exposing (test)


all =
    [ test "example" <|
        \() ->
            Permutations.verifyCombinations3
                (\n s q ->
                    let
                        createItem name sellIn quality =
                            GildedRose.Item name sellIn quality
                    in
                    GildedRose.updateQuality [ createItem n s q ]
                )
                [ "", "Sulfuras, Hand of Ragnaros", "Aged Brie", "Backstage passes to a TAFKAL80ETC concert" ]
                (List.range -1 50)
                (List.range -1 50)
    ]
