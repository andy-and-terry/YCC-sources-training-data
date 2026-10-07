class Monster implements Cloneable {
    String species
    int hp
    int attack

    Monster(String species, int hp, int attack) {
        this.species = species
        this.hp = hp
        this.attack = attack
    }

    Monster clone() {
        new Monster(species, hp, attack)
    }
}

def template = new Monster("Goblin", 20, 5)
def goblin1 = template.clone()
def goblin2 = template.clone()
goblin2.hp = 15

println "template hp: ${template.hp}"
println "goblin1 hp: ${goblin1.hp}, goblin2 hp: ${goblin2.hp}"
