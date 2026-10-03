class TreeType {
    String name, color, texture

    TreeType(String name, String color, String texture) {
        this.name = name
        this.color = color
        this.texture = texture
    }
}

class TreeFactory {
    Map<String, TreeType> cache = [:]

    TreeType get(String name, String color, String texture) {
        def key = "${name}_${color}_${texture}"
        if (!cache.containsKey(key)) {
            cache[key] = new TreeType(name, color, texture)
            println "created new shared TreeType for $key"
        }
        cache[key]
    }
}

def factory = new TreeFactory()
[[0, 0], [5, 5], [10, 10]].each { pos ->
    def t = factory.get("oak", "green", "bark_01")
    println "tree ${t.name} at (${pos[0]}, ${pos[1]})"
}
println "unique flyweight objects: ${factory.cache.size()}"
