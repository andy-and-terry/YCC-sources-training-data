interface Greeter {
    String name()
    default String greet() { "Hello, ${name()}!" }
    static Greeter of(String n) { { -> n } as Greeter }
}

class Polite implements Greeter {
    String name() { 'Sir' }
    String greet() { Greeter.super.greet() + ' Pleased to meet you.' }
}

println new Polite().greet()
println Greeter.of('Bob').greet()
