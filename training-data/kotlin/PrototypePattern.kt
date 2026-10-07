data class Monster(val species: String, var hp: Int, val attack: Int) {
    fun cloneMonster() = copy()
}

fun main() {
    val template = Monster("Goblin", 20, 5)
    val goblin1 = template.cloneMonster()
    val goblin2 = template.cloneMonster()
    goblin2.hp = 15

    println("template hp: ${template.hp}")
    println("goblin1 hp: ${goblin1.hp}, goblin2 hp: ${goblin2.hp}")
}
