module Identifiable
  macro included
    @@next_id = 1

    def self.next_id : Int32
      id = @@next_id
      @@next_id += 1
      id
    end
  end

  def identify : String
    "#{self.class.name}##{@id}"
  end
end

class Ticket
  include Identifiable

  def initialize
    @id = Ticket.next_id
  end
end

t1 = Ticket.new
t2 = Ticket.new
puts t1.identify
puts t2.identify
