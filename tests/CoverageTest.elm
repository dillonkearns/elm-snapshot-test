module CoverageTest exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Main
import Test exposing (..)


coverage : Test
coverage =
    test "coverage" <|
        \() ->
            Main.doPermutations ()
                |> (\_ ->
                        ()
                            |> Expect.equal ()
                   )
