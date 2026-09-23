class ChatRoom
  def show_message(user, message)
    puts "[#{Time.now.strftime('%H:%M')}] #{user.name}: #{message}"
  end
end

class User
  attr_reader :name

  def initialize(name, chat_room)
    @name = name
    @chat_room = chat_room
  end

  def send_message(message)
    @chat_room.show_message(self, message)
  end
end

room = ChatRoom.new
alice = User.new('Alice', room)
bob = User.new('Bob', room)

alice.send_message('hey bob!')
bob.send_message('hey alice, how are you?')
