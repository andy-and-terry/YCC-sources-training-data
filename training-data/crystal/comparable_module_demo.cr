class Version
  include Comparable(Version)

  getter major : Int32
  getter minor : Int32
  getter patch : Int32

  def initialize(@major : Int32, @minor : Int32, @patch : Int32)
  end

  def <=>(other : Version) : Int32
    return major <=> other.major unless major == other.major
    return minor <=> other.minor unless minor == other.minor
    patch <=> other.patch
  end

  def to_s(io)
    io << "#{major}.#{minor}.#{patch}"
  end
end

versions = [Version.new(1, 2, 0), Version.new(1, 0, 5), Version.new(2, 0, 0)]
puts versions.sort.map(&.to_s).join(", ")
puts Version.new(1, 2, 0) < Version.new(1, 3, 0)
puts Version.new(1, 2, 0).between?(Version.new(1, 0, 0), Version.new(2, 0, 0))
puts versions.max.to_s
