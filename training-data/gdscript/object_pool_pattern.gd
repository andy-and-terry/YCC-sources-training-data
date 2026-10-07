extends Node

class Bullet:
	var active: bool = false
	var position: Vector2 = Vector2.ZERO

	func fire(from: Vector2) -> void:
		active = true
		position = from

	func deactivate() -> void:
		active = false

class BulletPool:
	var pool: Array = []

	func _init(size: int):
		for i in range(size):
			pool.append(Bullet.new())

	func acquire() -> Bullet:
		for bullet in pool:
			if not bullet.active:
				return bullet
		var extra = Bullet.new()
		pool.append(extra)
		return extra

	func release(bullet: Bullet) -> void:
		bullet.deactivate()

	func active_count() -> int:
		var count = 0
		for bullet in pool:
			if bullet.active:
				count += 1
		return count

func _ready():
	var pool = BulletPool.new(2)
	var a = pool.acquire()
	a.fire(Vector2(0, 0))
	var b = pool.acquire()
	b.fire(Vector2(1, 1))
	print("active: ", pool.active_count())

	pool.release(a)
	print("active after release: ", pool.active_count())

	var c = pool.acquire()
	print("pool reused released bullet: ", c == a)
