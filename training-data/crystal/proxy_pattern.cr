module Displayable
  abstract def display
end

class RealImage
  include Displayable

  def initialize(@filename : String)
    load_from_disk
  end

  def load_from_disk
    puts "Loading #{@filename} from disk"
  end

  def display
    puts "Displaying #{@filename}"
  end
end

class ProxyImage
  include Displayable

  def initialize(@filename : String)
    @real_image = nil
  end

  def display
    image = @real_image ||= RealImage.new(@filename)
    image.display
  end
end

image = ProxyImage.new("photo.png")
puts "proxy created, no load yet"
image.display
image.display
