struct Deck {
    enum Suit: String, CaseIterable {
        case hearts = "H", spades = "S"
    }

    struct Card {
        let suit: Suit
        let rank: Int

        var label: String { "\(rank)\(suit.rawValue)" }
    }

    let cards: [Card]

    init() {
        cards = Suit.allCases.flatMap { suit in
            (1...3).map { Card(suit: suit, rank: $0) }
        }
    }
}

let deck = Deck()
print(deck.cards.map(\.label).joined(separator: " "))
let c = Deck.Card(suit: .spades, rank: 12)
print(c.label)
