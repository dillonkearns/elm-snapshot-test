module GildedRose exposing (Item(..), updateQuality)


type alias GildedRose =
    List Item


type Item
    = Item String Int Int


updateQuality : List Item -> List Item
updateQuality =
    List.map updateItemQuality_


updateItemQuality_ : Item -> Item
updateItemQuality_ ((Item name sellIn quality) as item) =
    case name of
        "Aged Brie" ->
            let
                quality_ =
                    if quality < 50 then
                        quality + 1

                    else
                        quality

                sellIn_ =
                    sellIn - 1
            in
            if sellIn_ < 0 then
                if quality_ < 50 then
                    Item name sellIn_ (quality_ + 1)

                else
                    Item name sellIn_ quality_

            else
                Item name sellIn_ quality_

        "Backstage passes to a TAFKAL80ETC concert" ->
            let
                quality_ =
                    if quality < 50 then
                        quality
                            + 1
                            + (if sellIn < 11 then
                                if quality < 49 then
                                    1
                                        + (if sellIn < 6 then
                                            if quality < 48 then
                                                1

                                            else
                                                0

                                           else
                                            0
                                          )

                                else
                                    0

                               else
                                0
                              )

                    else
                        quality

                sellIn_ =
                    sellIn - 1
            in
            if sellIn_ < 0 then
                Item name sellIn_ (quality_ - quality_)

            else
                Item name sellIn_ quality_

        _ ->
            let
                quality_ =
                    if quality > 0 then
                        if name /= "Sulfuras, Hand of Ragnaros" then
                            quality - 1

                        else
                            quality

                    else
                        quality

                sellIn_ =
                    if name /= "Sulfuras, Hand of Ragnaros" then
                        sellIn - 1

                    else
                        sellIn
            in
            if sellIn_ < 0 then
                if quality_ > 0 then
                    if name /= "Sulfuras, Hand of Ragnaros" then
                        Item name sellIn_ (quality_ - 1)

                    else
                        Item name sellIn_ quality_

                else
                    Item name sellIn_ quality_

            else
                Item name sellIn_ quality_
