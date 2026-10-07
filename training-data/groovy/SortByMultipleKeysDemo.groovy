class Player {
    String name
    String team
    int score

    String toString() { "${name}(${team},${score})" }
}

def players = [
    new Player(name: 'Zed', team: 'red', score: 10),
    new Player(name: 'Amy', team: 'blue', score: 10),
    new Player(name: 'Bea', team: 'red', score: 30),
    new Player(name: 'Cal', team: 'blue', score: 20),
    new Player(name: 'Dan', team: 'red', score: 30)
]

println players.sort(false) { it.score }
println players.sort(false) { a, b -> b.score <=> a.score }

// Compare by several keys using the spaceship operator and Elvis
println players.sort(false) { a, b ->
    a.team <=> b.team ?: b.score <=> a.score ?: a.name <=> b.name
}

println players.sort(false) { a, b ->
    a.team <=> b.team ?: b.score <=> a.score
}*.name

println players.toSorted { it.name }.reverse()*.name
println players.min { it.score }
println players.sort(false) { it.name.toLowerCase() }.collect { it.name }.join('<')
