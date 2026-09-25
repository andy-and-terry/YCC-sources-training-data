require 'uri'

# Hand-rolled parser that groups repeated keys, compared with URI.decode_www_form.
def parse_query(qs)
  qs.delete_prefix('?').split('&').reject(&:empty?).each_with_object(Hash.new { |h, k| h[k] = [] }) do |pair, out|
    key, value = pair.split('=', 2)
    out[URI.decode_www_form_component(key)] << URI.decode_www_form_component(value.to_s)
  end
end

qs = '?name=J%C3%BCrgen+M&tag=a&tag=b&empty='
parsed = parse_query(qs)
p parsed
p URI.decode_www_form(qs.delete_prefix('?'))
puts URI.encode_www_form(parsed.flat_map { |k, vs| vs.map { |v| [k, v] } })
