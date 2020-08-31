module Permutations exposing (test, verify, verify2, verify3, verifyCombinations2, verifyCombinations3)

import Json.Encode as Encode


type alias SnapshotValue =
    { name : String, value : Encode.Value }


test : String -> (() -> Encode.Value) -> SnapshotValue
test name getVerification =
    { name = name
    , value = getVerification ()
    }


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


map3 : (a -> b -> c -> d) -> List a -> List b -> List c -> List d
map3 function list1 list2 list3 =
    List.concatMap
        (\item1 ->
            List.concatMap
                (\item2 ->
                    List.map (function item1 item2) list3
                )
                list2
        )
        list1


verify : (a -> b) -> a -> Encode.Value
verify function a =
    [ ( Debug.toString a
      , function a |> Debug.toString |> Encode.string
      )
    ]
        |> Encode.object


verify2 : (a -> b -> c) -> a -> b -> Encode.Value
verify2 function a b =
    [ ( Debug.toString a ++ ", " ++ Debug.toString b
      , function a b |> Debug.toString |> Encode.string
      )
    ]
        |> Encode.object


verify3 : (a -> b -> c -> d) -> a -> b -> c -> Encode.Value
verify3 function a b c =
    [ ( Debug.toString a ++ ", " ++ Debug.toString b ++ ", " ++ Debug.toString c
      , function a b c |> Debug.toString |> Encode.string
      )
    ]
        |> Encode.object


verifyCombinations2 : (a -> b -> c) -> List a -> List b -> Encode.Value
verifyCombinations2 function list1 list2 =
    map2
        (\a b ->
            ( Debug.toString a ++ ", " ++ Debug.toString b
            , function a b |> Debug.toString |> Encode.string
            )
        )
        list1
        list2
        |> Encode.object


verifyCombinations3 : (a -> b -> c -> d) -> List a -> List b -> List c -> Encode.Value
verifyCombinations3 function list1 list2 list3 =
    map3
        (\a b c ->
            ( Debug.toString a ++ ", " ++ Debug.toString b ++ ", " ++ Debug.toString c
            , function a b c |> Debug.toString |> Encode.string
            )
        )
        list1
        list2
        list3
        |> Encode.object
