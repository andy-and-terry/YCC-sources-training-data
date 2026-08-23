class DynamicGreeter {
    def methodMissing(String name, args) {
        if (name.startsWith("greetIn")) {
            def language = name.substring(7)
            return "Hello in ${language}!"
        }
        throw new MissingMethodException(name, DynamicGreeter, args)
    }
}

def greeter = new DynamicGreeter()
println greeter.greetInSpanish()
println greeter.greetInFrench()
