let data = {'name': 'vim', 'tags': ['editor', 'modal'], 'version': 9, 'stable': v:true, 'extra': v:null}

let text = json_encode(data)
echo text

let back = json_decode(text)
echo back.name
echo back.tags[1]
echo back.version + 1
echo back.stable == v:true
echo back.extra is v:null
echo type(back.stable) == v:t_bool

let parsed = json_decode('[1, 2.5, "three", {"k": [true, false]}]')
echo parsed
echo parsed[3].k[0]

try
  call json_decode('{bad json}')
catch
  echo 'invalid JSON rejected'
endtry

echo string(data.tags)
echo eval(string(data.tags)) == data.tags
