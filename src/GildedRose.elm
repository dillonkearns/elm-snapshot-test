module GildedRose exposing (Item, createItem, updateQuality)


type alias GildedRose =
    List Item


type Item
    = Item String Int Int


type alias Name =
    String


createItem : String -> Int -> Int -> Item
createItem name sellIn quality =
    Item name sellIn quality


updateQuality : GildedRose -> GildedRose
updateQuality =
    List.map updateQualityItem


updateQualityItem (Item name sellIn quality) =
    let
        quality_ =
            if name /= "Aged Brie" && name /= "Backstage passes to a TAFKAL80ETC concert" then
                if quality > 0 then
                    if name /= "Sulfuras, Hand of Ragnaros" then
                        quality - 1

                    else
                        quality

                else
                    quality

            else if quality < 50 then
                quality
                    + 1
                    + (if name == "Backstage passes to a TAFKAL80ETC concert" then
                        if sellIn < 11 then
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

                       else
                        0
                      )

            else
                quality

        sellIn_ =
            if name /= "Sulfuras, Hand of Ragnaros" then
                sellIn - 1

            else
                sellIn
    in
    if sellIn_ < 0 then
        if name /= "Aged Brie" then
            if name /= "Backstage passes to a TAFKAL80ETC concert" then
                if quality_ > 0 then
                    if name /= "Sulfuras, Hand of Ragnaros" then
                        createItem name sellIn_ (quality_ - 1)

                    else
                        createItem name sellIn_ quality_

                else
                    createItem name sellIn_ quality_

            else
                createItem name sellIn_ (quality_ - quality_)

        else if quality_ < 50 then
            createItem name sellIn_ (quality_ + 1)

        else
            createItem name sellIn_ quality_

    else
        createItem name sellIn_ quality_
