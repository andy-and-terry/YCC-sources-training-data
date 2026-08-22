protocol Observer: AnyObject {
    func update(_ value: Int)
}

final class Subject {
    private var observers: [Observer] = []

    func subscribe(_ observer: Observer) {
        observers.append(observer)
    }

    func notify(_ value: Int) {
        observers.forEach { $0.update(value) }
    }
}

final class ConcreteObserver: Observer {
    let name: String
    init(_ name: String) { self.name = name }
    func update(_ value: Int) {
        print("\(name) received \(value)")
    }
}

let subject = Subject()
subject.subscribe(ConcreteObserver("A"))
subject.subscribe(ConcreteObserver("B"))
subject.notify(42)
