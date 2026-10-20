import selectors
import socket


if __name__ == "__main__":
    sel = selectors.DefaultSelector()
    a, b = socket.socketpair()
    a.setblocking(False)
    b.setblocking(False)
    sel.register(a, selectors.EVENT_READ, data="a")
    b.send(b"ping")
    for key, _mask in sel.select(timeout=1):
        msg = key.fileobj.recv(16)
        print(key.data, msg)
    print(sel.select(timeout=0.05))  # nothing more to read
    sel.unregister(a)
    a.close()
    b.close()
    sel.close()
