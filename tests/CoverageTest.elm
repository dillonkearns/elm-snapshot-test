module CoverageTest exposing (..)

import Expect exposing (Expectation)
import SnapshotTests
import Test exposing (..)


coverage : Test
coverage =
    test "coverage" <|
        \() ->
            SnapshotTests.all
                |> (\_ ->
                        ()
                            |> Expect.equal ()
                   )
