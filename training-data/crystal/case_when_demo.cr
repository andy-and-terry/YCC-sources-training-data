def http_status_category(code : Int32) : String
  case code
  when 200..299
    "success"
  when 300..399
    "redirect"
  when 400..499
    "client error"
  when 500..599
    "server error"
  else
    "unknown"
  end
end

[200, 301, 404, 503, 999].each do |code|
  puts "#{code}: #{http_status_category(code)}"
end
