class ChatRoom
  def initialize
    @users = {}
  end

  def register(user)
    @users[user.name] = user
    user.room = self
  end

  def relay(sender, message)
    @users.each_value do |user|
      user.receive(sender, message) unless user.name == sender
    end
  end
end

class User
  attr_accessor :room
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def send_message(message)
    room.relay(name, message)
  end

  def receive(sender, message)
    puts "#{name} received from #{sender}: #{message}"
  end
end

room = ChatRoom.new
alice = User.new("alice")
bob = User.new("bob")
room.register(alice)
room.register(bob)

alice.send_message("hi bob")
bob.send_message("hey alice")
