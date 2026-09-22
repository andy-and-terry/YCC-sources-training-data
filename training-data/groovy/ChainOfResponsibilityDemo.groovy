abstract class Approver {
    Approver next

    Approver setNext(Approver n) {
        next = n
        return n
    }

    abstract void approve(double amount)

    void forward(double amount) {
        if (next) {
            next.approve(amount)
        } else {
            println "No one could approve $amount"
        }
    }
}

class Manager extends Approver {
    void approve(double amount) {
        if (amount <= 1000) {
            println "Manager approved $amount"
        } else {
            forward(amount)
        }
    }
}

class Director extends Approver {
    void approve(double amount) {
        if (amount <= 5000) {
            println "Director approved $amount"
        } else {
            forward(amount)
        }
    }
}

class VicePresident extends Approver {
    void approve(double amount) {
        println "VP approved $amount"
    }
}

def manager = new Manager()
def director = new Director()
def vp = new VicePresident()
manager.setNext(director).setNext(vp)

[500, 3000, 9000].each { manager.approve(it) }
