module GildedRose exposing (Item(..), updateQuality)

import Item


type alias GildedRose =
    List Item


type Item
    = Item String Int Int


updateQuality : List Item -> List Item
updateQuality =
    let
        _ =
            125
    in
    List.map updateItemQuality_


updateItemQuality_ : Item -> Item
updateItemQuality_ ((Item name sellIn quality) as item) =
    Item.updateItemQuality_
        { name = name
        , sellIn = sellIn
        , quality = quality
        }
        |> (\updatedItem ->
                Item updatedItem.name updatedItem.sellIn updatedItem.quality
           )
