def fft(a)
  n = a.size
  return a if n == 1

  even = fft(a.values_at(*(0...n).step(2)))
  odd = fft(a.values_at(*(1...n).step(2)))
  out = Array.new(n)
  (0...n / 2).each do |k|
    t = Complex.polar(1, -2 * Math::PI * k / n) * odd[k]
    out[k] = even[k] + t
    out[k + n / 2] = even[k] - t
  end
  out
end

z1 = Complex(3, 4)
z2 = Complex(1, -2)
puts "#{z1 + z2} #{z1 * z2} #{z1 / z2.to_c} |z1|=#{z1.abs}"
e = Math::E**Complex(0, Math::PI)
puts "e^(i*pi) = #{e.real.round(6)} + #{e.imaginary.round(6)}i"
puts fft([1, 1, 1, 1, 0, 0, 0, 0].map(&:to_c)).map { |c| format('%.3f%+.3fi', c.real, c.imaginary) }.join(' ')
