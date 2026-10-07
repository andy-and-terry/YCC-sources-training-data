MORSE = {
  'A' => '.-', 'B' => '-...', 'C' => '-.-.', 'D' => '-..', 'E' => '.', 'F' => '..-.', 'G' => '--.',
  'H' => '....', 'I' => '..', 'J' => '.---', 'K' => '-.-', 'L' => '.-..', 'M' => '--', 'N' => '-.',
  'O' => '---', 'P' => '.--.', 'Q' => '--.-', 'R' => '.-.', 'S' => '...', 'T' => '-', 'U' => '..-',
  'V' => '...-', 'W' => '.--', 'X' => '-..-', 'Y' => '-.--', 'Z' => '--..', '0' => '-----',
  '1' => '.----', '2' => '..---', '3' => '...--', '4' => '....-', '5' => '.....', '6' => '-....',
  '7' => '--...', '8' => '---..', '9' => '----.'
}.freeze
REVERSE = MORSE.invert.freeze

def encode(text) = text.upcase.split.map { |w| w.chars.filter_map { |c| MORSE[c] }.join(' ') }.join(' / ')
def decode(code) = code.split(' / ').map { |w| w.split.map { |s| REVERSE.fetch(s, '?') }.join }.join(' ')

m = encode('SOS help 2024')
puts m, decode(m)
