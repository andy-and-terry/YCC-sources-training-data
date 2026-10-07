let data = {'name': 'vim', 'tags': ['editor', 'modal'], 'version': 9, 'stable': v:true}
let text = json_encode(data)
echo text

let back = json_decode(text)
echo back.name
echo back.tags[1]
echo back.version + 1
echo back.stable == v:true

let parsed = json_decode('[1, 2.5, "three", null]')
echo parsed
echo type(parsed[1]) == v:t_float ? 'float' : 'other'
echo json_encode([1, 'a', v:null])
