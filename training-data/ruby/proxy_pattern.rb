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
    puts "loading #{@filename} from disk (expensive)"
  end
end

# The proxy stands in for RealImage and defers the expensive load until
# the image is actually displayed -- callers can't tell the difference.
class ImageProxy
  def initialize(filename)
    @filename = filename
    @real_image = nil
  end

  def display
    @real_image ||= RealImage.new(@filename)
    @real_image.display
  end
end

images = [ImageProxy.new("photo1.png"), ImageProxy.new("photo2.png")]

puts "proxies created, nothing loaded yet"
images.first.display
images.first.display # no reload the second time
images.last.display
