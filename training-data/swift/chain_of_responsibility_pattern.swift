struct Ticket {
    let level: Int
    let message: String
}

protocol SupportHandler: AnyObject {
    var next: SupportHandler? { get set }
    func handle(_ ticket: Ticket) -> String?
}

class BaseHandler: SupportHandler {
    var next: SupportHandler?
    let name: String
    let levelHandled: Int

    init(name: String, levelHandled: Int) {
        self.name = name
        self.levelHandled = levelHandled
    }

    func handle(_ ticket: Ticket) -> String? {
        if ticket.level <= levelHandled {
            return "\(name) resolved: \(ticket.message)"
        }
        return next?.handle(ticket)
    }
}

let tier1 = BaseHandler(name: "Tier1", levelHandled: 1)
let tier2 = BaseHandler(name: "Tier2", levelHandled: 2)
let tier3 = BaseHandler(name: "Tier3", levelHandled: 3)
tier1.next = tier2
tier2.next = tier3

let tickets = [
    Ticket(level: 1, message: "password reset"),
    Ticket(level: 3, message: "server outage"),
    Ticket(level: 5, message: "unknown issue"),
]

for ticket in tickets {
    print(tier1.handle(ticket) ?? "unresolved: \(ticket.message)")
}
