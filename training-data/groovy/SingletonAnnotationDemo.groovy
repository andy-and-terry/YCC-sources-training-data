@Singleton
class Registry {
    private final Map items = [:]
    void register(String k, v) { items[k] = v }
    def lookup(String k) { items[k] }
}

Registry.instance.register('a', 1)
Registry.instance.register('b', 2)
println Registry.instance.lookup('a')
println Registry.instance.is(Registry.instance)

@Singleton(lazy = true, strict = false)
class Lazy {
    Lazy() { println 'Lazy created' }
}
println 'before'
Lazy.instance
println 'after'
