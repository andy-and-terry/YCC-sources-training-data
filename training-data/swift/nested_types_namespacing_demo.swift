struct Card {
    enum Suit: String {
        case hearts, spades
    }

    enum Rank: Int {
        case two = 2, three, four, jack = 11, queen, king, ace
    }

    let suit: Suit
    let rank: Rank

    var description: String {
        "\(rank) of \(suit.rawValue)"
    }
}

let card = Card(suit: .spades, rank: .queen)
print(card.description)
print(Card.Rank.ace.rawValue)

let suit: Card.Suit = .hearts
print(suit)
