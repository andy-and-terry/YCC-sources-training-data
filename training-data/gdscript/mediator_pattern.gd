extends Node

class ChatMediator:
	var members: Array = []

	func register(member) -> void:
		members.append(member)
		member.mediator = self

	func broadcast(sender, message: String) -> void:
		for member in members:
			if member != sender:
				member.receive(message)

class ChatMember:
	var name: String
	var mediator: ChatMediator = null

	func _init(n: String) -> void:
		name = n

	func send(message: String) -> void:
		print("%s sends: %s" % [name, message])
		mediator.broadcast(self, message)

	func receive(message: String) -> void:
		print("%s received: %s" % [name, message])

func _ready():
	var mediator := ChatMediator.new()
	var alice := ChatMember.new("Alice")
	var bob := ChatMember.new("Bob")
	mediator.register(alice)
	mediator.register(bob)
	alice.send("hello everyone")
