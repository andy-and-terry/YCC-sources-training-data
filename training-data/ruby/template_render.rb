require 'erb'

FILTERS = { 'upper' => :upcase, 'lower' => :downcase, 'title' => ->(s) { s.split.map(&:capitalize).join(' ') } }.freeze

def render(template, ctx)
  template.gsub(/\{\{\s*([\w.]+)\s*(?:\|\s*(\w+)\s*)?\}\}/) do
    value = Regexp.last_match(1).split('.').reduce(ctx) { |obj, key| obj.fetch(key.to_sym) }.to_s
    filter = FILTERS[Regexp.last_match(2)]
    filter.is_a?(Symbol) ? value.public_send(filter) : filter ? filter.call(value) : value
  end
end

ctx = { user: { name: 'ada lovelace' }, count: 3, kind: 'messages' }
puts render('Hello {{ user.name | title }}, you have {{count}} new {{ kind|upper }}.', ctx)

# the same idea with the standard library's ERB
Item = Struct.new(:name, :qty)
erb = ERB.new("<% items.each do |i| -%>\n- <%= i.name %> x<%= i.qty %>\n<% end -%>\n", trim_mode: '-')
puts erb.result_with_hash(items: [Item.new('pen', 2), Item.new('notebook', 1)])
