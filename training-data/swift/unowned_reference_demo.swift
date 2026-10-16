class Customer {
    let name: String
    var card: CreditCard?

    init(name: String) { self.name = name }
    deinit { print("customer \(name) freed") }
}

class CreditCard {
    let number: String
    unowned let owner: Customer

    init(number: String, owner: Customer) {
        self.number = number
        self.owner = owner
    }
    deinit { print("card \(number) freed") }
}

var customer: Customer? = Customer(name: "Ada")
customer!.card = CreditCard(number: "1234", owner: customer!)
print(customer!.card!.owner.name)
customer = nil
