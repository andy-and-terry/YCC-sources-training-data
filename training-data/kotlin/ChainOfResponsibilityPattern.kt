abstract class Approver {
    var next: Approver? = null

    fun setNext(handler: Approver): Approver {
        next = handler
        return handler
    }

    abstract fun handle(amount: Int)
}

class SmallApprover : Approver() {
    override fun handle(amount: Int) {
        if (amount <= 100) println("small approver handled $amount")
        else next?.handle(amount)
    }
}

class ManagerApprover : Approver() {
    override fun handle(amount: Int) {
        if (amount <= 1000) println("manager handled $amount")
        else next?.handle(amount)
    }
}

class DirectorApprover : Approver() {
    override fun handle(amount: Int) = println("director handled $amount")
}

fun main() {
    val chain = SmallApprover()
    chain.setNext(ManagerApprover()).setNext(DirectorApprover())
    chain.handle(50)
    chain.handle(500)
    chain.handle(5000)
}
