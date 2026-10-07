trait Greeter {
    String greet() { "Hello, I am a Greeter" }
}

trait Loud {
    String shout(String message) { message.toUpperCase() + "!" }
}

class Robot implements Greeter {
    String greet() { "Beep boop, " + Greeter.super.greet() }
}

def robot = new Robot()
println robot.greet()

class Whisperer {
    String whisper(String message) { message.toLowerCase() }
}

def loudWhisperer = new Whisperer() as Loud
println loudWhisperer.shout("can you hear me")
