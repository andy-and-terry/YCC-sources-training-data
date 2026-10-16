class Host {
    String name = 'host'
    def run() {
        def c = {
            [this: this.name, owner: owner.name, delegate: delegate.name]
        }
        c()
    }
    def nested() {
        def outer = {
            def inner = { owner.class.simpleName }
            inner()
        }
        outer()
    }
}
println new Host().run()
println new Host().nested()

def c = { delegate.size() }
c.delegate = 'abcd'
println c()
def d = { -> this.class.simpleName }
println d()
