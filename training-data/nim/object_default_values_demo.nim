type
  Config = object
    host: string
    port: int
    verbose: bool
    tags: seq[string]

proc initConfig(host = "localhost", port = 8080): Config =
  Config(host: host, port: port)

var c = Config()
echo c
let d = initConfig(port = 9000)
echo d
echo d.tags.len
var e = d
e.verbose = true
echo d.verbose, " ", e.verbose
