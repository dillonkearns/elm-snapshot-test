module SnapshotTests exposing (..)

import GildedRose
import Permutations exposing (test)


all =
    [ test "example" <|
        \() ->
            Permutations.verify3 (\a b c -> GildedRose.updateQuality [ GildedRose.Item a b c ])
                ""
                1
                0
    , test "example2" <|
        \() ->
            Permutations.verify3 (\a b c -> GildedRose.updateQuality [ GildedRose.Item a b c ])
                "Hello!"
                2
                3
    ]
