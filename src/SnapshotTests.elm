module SnapshotTests exposing (..)

import GildedRose
import Permutations exposing (test)


all =
    [ test "example" <|
        \() ->
            Permutations.verifyCombinations3
                (\first second third ->
                    first ++ String.fromInt second ++ String.fromInt third
                )
                [ "A", "B", "C" ]
                [ 1, 2, 3 ]
                [ 97, 98, 99 ]
    ]
