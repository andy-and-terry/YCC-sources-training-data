class Resource {
    let id: Int

    init(id: Int) {
        self.id = id
        print("acquired resource \(id)")
    }

    deinit {
        print("released resource \(id)")
    }
}

func useTemporarily() {
    let r = Resource(id: 1)
    print("using resource \(r.id)")
}

useTemporarily()

var held: Resource? = Resource(id: 2)
print("holding \(held!.id)")
held = nil
print("done")
