module SnapshotTests exposing (..)

import GildedRose
import Permutations exposing (test)


all =
    [ test "example" <|
        \() ->
            Permutations.verify3 (\a b c -> GildedRose.updateQuality [ GildedRose.Item a b c ])
                ""
                0
                0
    ]
