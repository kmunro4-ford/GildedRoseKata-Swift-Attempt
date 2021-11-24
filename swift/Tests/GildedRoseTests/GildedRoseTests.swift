@testable import GildedRose
import XCTest

class GildedRoseTests: XCTestCase {
    
    let items = [
        Item(name: "foo", sellIn: 0, quality: 0),
        Item(name: "Aged Brie", sellIn: 2, quality: 10),
        Item(name: "+5 Dexterity Vest", sellIn: 10, quality: 10),
        Item(name: "Elixir of the Mongoose", sellIn: 5, quality: 7),
        Item(name: "Sulfuras, Hand of Ragnaros", sellIn: 1, quality: 80),
        Item(name: "Sulfuras, Hand of Ragnaros", sellIn: -1, quality: 80),
        Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 15, quality: 20),
        Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 10, quality: 49),
        Item(name: "Backstage passes to a TAFKAL80ETC concert", sellIn: 5, quality: 49),
        // this conjured item does not work properly yet
        Item(name: "Conjured Mana Cake", sellIn: 3, quality: 6)]

    
    func testFoo() throws {
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[0].name, "foo")
    }
    
    func testAgedBrieSellIn() throws {
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[1].sellIn, 1)
    }
    
    func testAgedBrieQuality() throws {
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[1].quality, 11)
    }
    
    func testDexterityVest() throws {
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[2].quality, 11)
    }
    
    func testElixerOfTheMongoose() throws {
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[3].quality, 8)
    }
    

    func testSulfurasHandOfRagnaros() throws {
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[4].quality, 80)
    }
    
    func testBackstagePassSellIn15() throws {
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[6].quality, 21)
    }
    
    func testBackstagePassSellIn10() throws {
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[7].quality, 50)
    }
    
    func testBackstagePassSellIn5() throws {
        let app = GildedRose(items: items)
        app.updateQuality()
        XCTAssertEqual(app.items[8].quality, 50)
    }
    
    static var allTests = [
        ("testFoo", testFoo),
        ("testAgedBrieQuality", testAgedBrieQuality),
        ("testDexterityVest", testDexterityVest),
        ("testElixerOfTheMongoose", testElixerOfTheMongoose),
        ("testBackstagePassSellIn15", testBackstagePassSellIn15),
        ("testBackstagePassSellIn10", testBackstagePassSellIn10),
        ("testBackstagePassSellIn5", testBackstagePassSellIn5)
//        ("testSulfurasHandOfRagnaros", testSulfurasHandOfRagnaros)
    ]
}
