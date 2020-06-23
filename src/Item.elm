module Item exposing (..)


type alias Item =
    { name : String
    , sellIn : Int
    , quality : Int
    }


updateItemQuality_ : Item -> Item
updateItemQuality_ ({ name, sellIn, quality } as item) =
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
                    { item | sellIn = sellIn_, quality = quality_ }

            else
                { item | sellIn = sellIn_, quality = quality_ }

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
                { item | sellIn = sellIn_, quality = 0 }

            else
                { item | sellIn = sellIn_, quality = quality_ }

        "Sulfuras, Hand of Ragnaros" ->
            let
                quality_ =
                    quality
            in
            item

        _ ->
            let
                quality_ =
                    if quality > 0 then
                        quality - 1

                    else
                        quality

                sellIn_ =
                    sellIn - 1
            in
            if sellIn_ < 0 then
                if quality_ > 0 then
                    Item name sellIn_ (quality_ - 1)

                else
                    Item name sellIn_ quality_

            else
                Item name sellIn_ quality_
