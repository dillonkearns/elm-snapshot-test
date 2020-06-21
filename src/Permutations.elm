module Permutations exposing (..)

--type Permutations a =

import Json.Encode as Encode


succeed : a -> a
succeed a =
    a


map2 : (a -> b -> c) -> List a -> List b -> List c
map2 function list1 list2 =
    List.concatMap
        (\item1 ->
            List.map (function item1) list2
        )
        list1


approve2 : (a -> b -> c) -> List a -> List b -> Encode.Value
approve2 function list1 list2 =
    map2
        (\a b ->
            ( Debug.toString a ++ Debug.toString b
            , function a b |> Debug.toString |> Encode.string
            )
        )
        list1
        list2
        |> Encode.object
