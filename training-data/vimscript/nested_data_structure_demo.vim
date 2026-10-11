" Nested lists and dicts, deep access and mutation.
let s:cfg = {'server': {'host': 'localhost', 'ports': [80, 443]}, 'tags': ['a', 'b']}
echo s:cfg.server.host
echo s:cfg.server.ports[1]
let s:cfg.server.ports += [8080]
let s:cfg['server']['tls'] = v:true
echo s:cfg
echo get(s:cfg, 'missing', 'default')
echo get(s:cfg.server, 'tls')
echo len(s:cfg.server.ports)
