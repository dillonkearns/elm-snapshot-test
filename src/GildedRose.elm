module GildedRose exposing (Item, createItem, updateQuality)


type alias GildedRose =
    List Item


type Item
    = Item Name SellIn Quality


type Name
    = Name String


type SellIn
    = SellIn Int


type Quality
    = Quality Int


createItem : String -> Int -> Int -> Item
createItem name sellIn quality =
    Item (Name name) (SellIn sellIn) (Quality quality)


updateQuality : GildedRose -> GildedRose
updateQuality =
    List.map updateQualityItem


updateItemSellIn : SellIn -> Item -> Item
updateItemSellIn newSellIn (Item name sellin quality) =
    Item name sellin quality


agedBrie : String
agedBrie =
    "Aged Brie"


backstagePass : String
backstagePass =
    "Backstage passes to a TAFKAL80ETC concert"


sulfuras =
    "Sulfuras, Hand of Ragnaros"


updateQualityItem (Item (Name name) (SellIn sellIn) (Quality quality)) =
    let
        quality_ =
            if name /= agedBrie && name /= backstagePass then
                if quality > 0 then
                    if name /= sulfuras then
                        quality - 1

                    else
                        quality

                else
                    quality

            else if quality < 50 then
                quality
                    + 1
                    + (if name == backstagePass then
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
            if name /= sulfuras then
                sellIn - 1

            else
                sellIn
    in
    if sellIn_ < 0 then
        if name /= agedBrie then
            if name /= backstagePass then
                if quality_ > 0 then
                    if name /= sulfuras then
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
