class RealImage
  def initialize(filename)
    @filename = filename
    load_from_disk
  end

  def display
    puts "displaying #{@filename}"
  end

  private

  def load_from_disk
    puts "loading #{@filename} from disk"
  end
end

class LazyImageProxy
  def initialize(filename)
    @filename = filename
    @real_image = nil
  end

  def display
    @real_image ||= RealImage.new(@filename)
    @real_image.display
  end
end

puts "proxy created, nothing loaded yet"
image = LazyImageProxy.new("photo.png")
puts "displaying twice:"
image.display
image.display
