class Server {
    String host = 'localhost'
    int port = 80
    boolean secure = false

    String url() { "${secure ? 'https' : 'http'}://$host:$port" }
}

def s = new Server(host: 'example.com', port: 8443, secure: true)
println s.url()
println new Server().url()

// Methods receiving named args get them as a leading Map
def connect(Map opts = [:], String name) {
    def host = opts.host ?: 'localhost'
    def retries = opts.retries ?: 3
    "$name -> $host (retries=$retries)"
}
println connect('db')
println connect('cache', host: '10.0.0.5')
println connect('queue', retries: 9, host: 'mq')

def describe(String label, int count = 1, String... extras) {
    "$label x$count ${extras.toList()}"
}
println describe('item')
println describe('item', 4)
println describe('item', 2, 'a', 'b')

def p = [x: 1, y: 2]
def point = new Expando(p)
point.z = 3
println point
