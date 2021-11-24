public class GildedRose {
    var items: [Item]
    
    public init(items: [Item]) {
        self.items = items
    }
    
    func updateQualityIncrease(placement: Int) -> Int {
        if placement >= 50 {
            return 0
        } else {
            let temp = placement + 1
            return temp
        }
    }
    
    func updateQualitySubtract(placement: Int) -> Int {
        if placement <= 0 {
            return 0
        } else {
            let temp = placement - 1
            return temp
        }
    }
    
    public func updateQuality() {
        for i in 0 ..< items.count {
            if (items[i].name != "Aged Brie" && items[i].name != "Backstage passes to a TAFKAL80ETC concert") {
                if (items[i].quality > 0) {
                    if (items[i].name != "Sulfuras, Hand of Ragnaros") {
                        items[i].quality = updateQualityIncrease(placement: items[i].quality)
                    }
                }
            } else {
                if (items[i].quality < 50) {
                    items[i].quality = updateQualityIncrease(placement: items[i].quality)
                    
                    if (items[i].name == "Backstage passes to a TAFKAL80ETC concert") {
                        if (items[i].sellIn < 11) {
                            if (items[i].quality < 50) {
                                items[i].quality = updateQualityIncrease(placement: items[i].quality)
                            }
                        }
                        
                        if (items[i].sellIn < 6) {
                            if (items[i].quality < 50) {
                                items[i].quality = updateQualityIncrease(placement: items[i].quality)
                            }
                        }
                    }
                }
            }
            
            if (items[i].name != "Sulfuras, Hand of Ragnaros") {
                items[i].sellIn = items[i].sellIn - 1
            }
            
            if (items[i].sellIn < 0) {
                if (items[i].name != "Aged Brie") {
                    if (items[i].name != "Backstage passes to a TAFKAL80ETC concert") {
                        if (items[i].quality > 0) {
                            if (items[i].name != "Sulfuras, Hand of Ragnaros") {
                                items[i].quality = updateQualitySubtract(placement: items[i].quality)
                            }
                        }
                    } else {
//                        Need to check what this is getting at below
                        items[i].quality = items[i].quality - items[i].quality
                    }
                } else {
                    if (items[i].quality < 50) {
                        items[i].quality = updateQualityIncrease(placement: items[i].quality)
                    }
                }
            }
        }
    }
}
