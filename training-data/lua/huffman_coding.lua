local function build_frequency_table(text)
  local freq = {}
  for i = 1, #text do
    local c = text:sub(i, i)
    freq[c] = (freq[c] or 0) + 1
  end
  return freq
end

local function pop_smallest(nodes)
  local best_index = 1
  for i = 2, #nodes do
    if nodes[i].freq < nodes[best_index].freq then
      best_index = i
    end
  end
  return table.remove(nodes, best_index)
end

local function build_tree(freq)
  local nodes = {}
  for char, count in pairs(freq) do
    table.insert(nodes, { char = char, freq = count })
  end

  while #nodes > 1 do
    local a = pop_smallest(nodes)
    local b = pop_smallest(nodes)
    table.insert(nodes, { freq = a.freq + b.freq, left = a, right = b })
  end

  return nodes[1]
end

local function build_codes(node, prefix, codes)
  if node.char then
    codes[node.char] = prefix == "" and "0" or prefix
    return
  end
  build_codes(node.left, prefix .. "0", codes)
  build_codes(node.right, prefix .. "1", codes)
end

local function encode(text, codes)
  local parts = {}
  for i = 1, #text do
    table.insert(parts, codes[text:sub(i, i)])
  end
  return table.concat(parts)
end

local text = "abracadabra"
local tree = build_tree(build_frequency_table(text))
local codes = {}
build_codes(tree, "", codes)

local chars = {}
for c in pairs(codes) do table.insert(chars, c) end
table.sort(chars)
for _, c in ipairs(chars) do
  print(c, codes[c])
end

local encoded = encode(text, codes)
print(encoded)
print("bits used:", #encoded)
