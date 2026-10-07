module CaseConvert
  module_function

  def words(s)
    s.gsub(/([A-Z]+)([A-Z][a-z])/, '\1 \2')
     .gsub(/([a-z\d])([A-Z])/, '\1 \2')
     .split(/[\s_\-]+/)
     .map(&:downcase)
  end

  def camel(s) = words(s).each_with_index.map { |w, i| i.zero? ? w : w.capitalize }.join
  def pascal(s) = words(s).map(&:capitalize).join
  def snake(s) = words(s).join('_')
  def kebab(s) = words(s).join('-')
  def constant(s) = snake(s).upcase
end

%w[parseHTTPResponse user_id background-color XMLHttpRequest].each do |s|
  puts [s, *%i[camel pascal snake kebab constant].map { |m| CaseConvert.public_send(m, s) }].map { |x| x.ljust(20) }.join
end
