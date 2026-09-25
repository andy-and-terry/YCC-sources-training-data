class InvalidIsbn < StandardError; end

def validate_isbn(raw)
  s = raw.delete('- ').upcase
  case s.size
  when 10
    raise InvalidIsbn, 'bad characters' unless s.match?(/\A\d{9}[\dX]\z/)

    total = s.chars.each_with_index.sum { |c, i| (10 - i) * (c == 'X' ? 10 : c.to_i) }
    raise InvalidIsbn, 'checksum' unless (total % 11).zero?

    :isbn10
  when 13
    raise InvalidIsbn, 'bad characters' unless s.match?(/\A\d{13}\z/)

    total = s.chars.each_with_index.sum { |c, i| c.to_i * (i.even? ? 1 : 3) }
    raise InvalidIsbn, 'checksum' unless (total % 10).zero?

    :isbn13
  else
    raise InvalidIsbn, "length #{s.size}"
  end
end

['0-306-40615-2', '0-306-40615-3', '978-0-306-40615-7', '0-8044-2957-X', '12345'].each do |isbn|
  puts "#{isbn.ljust(20)} #{validate_isbn(isbn)}"
rescue InvalidIsbn => e
  puts "#{isbn.ljust(20)} invalid (#{e.message})"
end
