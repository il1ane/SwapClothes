//
//  Article.swift
//  matchSystem
//
//  Created by Iliane Zedadra on 18/03/2021.
//

import Foundation

struct Article:Identifiable, Equatable, Hashable {

    var id = UUID()
    var name:String
    var image:String
    var description:String
    var isLiked:Bool = false
    var category:String
    var size:String
    var state:String

    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

//A
var tshirtA1 = Article(name: "White T-Shirt", image: "tshirtA1", description: "Simple white T-Shirt, wore it only 2 times.", category: "Haut", size: "M", state: "Neuf")
var sweaterA1 = Article(name: "Sweater Comme des garçons", image: "sweaterA1", description: """
Blue Colorblock Long Sleeve T-Shirt
Long sleeve cotton piqué T-shirt colorblocked in blue, navy, black, and burgundy. Raw edges throughout. Crewneck collar.
""", category: "Sweater", size: "L", state: "Brand New")
var shoesA1 = Article(name: "Converses comme des garçons", image: "shoesA1", description: """
Khaki Converse Edition Multiple Hearts Chuck 70 Low Sneakers
Low-top canvas sneakers in khaki. Round rubber cap toe in off-white. Signature graphic printed in red, white, and black throughout. Lace-up closure in off-white. Metal eyelet vents at inner side. Webbing trim in black at heel. Rubber midsole in off-white featuring rubberized logo patch at heel. Treaded rubber sole in brown. Silver-tone hardware.
""", category: "Chaussures", size: "42", state: "Neuf")
var pantsA1 = Article(name: "Pants Comme des garçons", image: "pantsA1", description: """
Black Tropical Wool Wide-Leg Trousers
Wide-leg tropical wool trousers in black. High-rise. Four-pocket styling. Belt loops at waistband. Pleats at front waistband. Zip-fly. Silver-tone hardware.
""", category: "Pantalon", size: "46", state: "Very good")
var scarfA1 = Article(name: "Andersson Bell scarf", image: "scarfA1", description: """
Exclusive Blue & Orange Check Veneto Scarf
Rectangular brushed alpaca, wool, and mohair-blend scarf featuring check pattern in tones of blue and orange. Textile logo patches in black and blue at face. Fringed detailing at ends.
""", category: "Scarf", size: "Approx. 74 length x 15.5 width", state: "Satisfying")

//B
var tshirtB1 = Article(name: "ONLINE CERAMICS t-shirt", image: "tshirtB1", description: """
White The Garden Of Your Heart T-Shirt
Short sleeve cotton jersey T-shirt in white. Rib knit crewneck collar. Text and graphics printed in multicolor at front. Text and graphics printed in yellow, brown, and black at back.
""", category: "T-Shirt", size: "S", state: "Good")
var sweaterB1 = Article(name: "AMBUSH sweater", image: "sweaterB1", description: """
Red Inserts Sweatshirt
Long sleeve French terry sweatshirt in red. Rib knit crewneck collar, cuffs, and hem. Logo embroidered in gold-tone at front.
""", category: "Sweater", size: "S", state: "Very Good")
var shoesB1 = Article(name: "Salomon sneakers", image: "shoesB1", description: """
Brown & Beige XT-6 Advanced Sneakers Low-top mesh sneakers in brown and beige. Bonded trim in gold-tone and white throughout. Round toe. Multicolor textile logo flag at bungee-style lace-up closure. Textile logo flag at tongue. Padded collar. Ortholite® Impressions insole. Logo printed in white at outer heel. Rubberized stripe in beige at welt.
""", category: "Sneakers", size: "42", state: "Brand New")
var pantsB1 = Article(name: "Isset Miyake jeans", image: "pantsB1", description: """
Green Burnt-Out Printed Denim Jeans
Slim-fit non-stretch denim jeans in grey featuring graphic pattern printed in green and jacquard graphic pattern woven in indigo. High-rise. Five-pocket styling. Belt loops at waistband. Zip-fly. Gunmetal-tone hardware.
""", category: "Jeans", size: "44", state: "Brand New")
var scarfB1 = Article(name: "Acne Studios scarf", image: "scarfB1", description: """
Multicolor Alpaca & Mohair Large Check Scarf
Rectangular brushed alpaca, wool, and mohair-blend scarf featuring check pattern in multicolor. Textile logo patch in white and black embroidered at face. Fringed detailing at ends.
""", category: "Scarf", size: "Approx. 98 length x 11 height.", state: "Very good")

//C
var tshirtC1 = Article(name: "T-Shirt", image: "tshirtC1", description: """
Exclusive Multicolor Squiggle Pierced T-Shirt
Short sleeve cotton jersey T-shirt in white featuring tie-dye pattern in tones of green and pink. Rib knit crewneck collar. Hardware with crystal-cut accents at chest. Silver-tone hardware.
""", category: "T-Shirt", size: "S", state: "Good")
var sweaterC1 = Article(name: "COLLINA STRADA Hoodie", image: "sweaterC1", description: """
Multicolor Round Hem Hoodie
Long sleeve cotton-blend fleece hoodie featuring tie-dye pattern in tones of yellow, green, and orange. Bungee-style drawstring in white at hood. Kangaroo pocket at waist. Dropped shoulders. Rib knit cuffs and drop-tail hem. Silver-tone hardware.
""", category: "Hoodie", size: "M", state: "Good")
var shoesC1 = Article(name: "Alexander Wang Sandals", image: "shoesC1", description: """
Black Jessie Lug Heeled Sandals Nylon webbing slip-on heeled sandals in black. Open square toe. Tonal thong-style strap featuring textile logo flag at vamp. Logo printed in white at tonal padded canvas footbed. Kitten heel. Tonal leather midsole. Tonal treaded rubber outsole. Approx. 2.25" heel.
""", category: "Heeled Sandals", size: "39", state: "Good")
var pantsC1 = Article(name: "Kwaidan Editions Jeans", image: "pantsC1", description: """
Blue Washed Straight-Leg Jeans
Straight-leg non-stretch denim jeans in blue. Mid-rise. Fading throughout. Five-pocket styling. Belt loops at waistband. Leather logo patch in black at back waistband. Button-fly. Silver-tone hardware. Contrast stitching in tan.
""", category: "Jeans", size: "44", state: "Used")
var scarfC1 = Article(name: "GUCCI Scarf", image: "scarfC1", description: """
Brown Check Jacquard GG Scarf
Rectangular knit wool-blend scarf featuring check pattern in tones of brown and beige. Jacquard knit logo pattern in brown throughout. Fringed detailing at ends.
""", category: "Scarf", size: "Approx. 86.5 length x 14 width.", state: "Brand New")

//Error
var errorCard = Article(name: "Oops...", image: "cardError", description: "", category: "", size: "", state: "")
