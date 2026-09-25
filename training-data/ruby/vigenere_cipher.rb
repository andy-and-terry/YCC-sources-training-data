class Vigenere
  def initialize(key)
    @shifts = key.downcase.scan(/[a-z]/).map { |c| c.ord - 97 }
    raise ArgumentError, 'key needs letters' if @shifts.empty?
  end

  def encrypt(text) = transform(text, 1)
  def decrypt(text) = transform(text, -1)

  private

  def transform(text, dir)
    shifts = @shifts.cycle
    text.gsub(/[a-z]/i) do |c|
      base = c =~ /[A-Z]/ ? 65 : 97
      ((c.ord - base + dir * shifts.next) % 26 + base).chr
    end
  end
end

v = Vigenere.new('LEMON')
c = v.encrypt('Attack at dawn!')
puts "#{c} -> #{v.decrypt(c)}"
