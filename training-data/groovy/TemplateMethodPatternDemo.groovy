abstract class GameLevel {
    final void play() {
        loadLevel()
        spawnEnemies()
        if (hasBoss()) spawnBoss()
        finishLevel()
    }

    void loadLevel() { println "loading level" }
    abstract void spawnEnemies()
    boolean hasBoss() { false }
    void spawnBoss() {}
    void finishLevel() { println "level complete" }
}

class ForestLevel extends GameLevel {
    void spawnEnemies() { println "spawning wolves" }
}

class CastleLevel extends GameLevel {
    void spawnEnemies() { println "spawning knights" }
    boolean hasBoss() { true }
    void spawnBoss() { println "spawning the dragon boss" }
}

new ForestLevel().play()
new CastleLevel().play()
