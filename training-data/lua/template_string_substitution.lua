local function render(template, values)
  return (template:gsub("{{(%w+)}}", values))
end

local template = "Hello {{name}}, you have {{count}} new messages."
print(render(template, { name = "Ada", count = "3" }))

local function title_case(s)
  return (s:gsub("(%a)(%w*)", function(first, rest)
    return first:upper() .. rest:lower()
  end))
end

print(title_case("the quick BROWN fox"))

local function parse_query(query)
  local params = {}
  for key, value in query:gmatch("([^&=?]+)=([^&=?]+)") do
    params[key] = value
  end
  return params
end

local params = parse_query("https://example.com/search?q=lua&sort=asc")
print(params.q, params.sort)
