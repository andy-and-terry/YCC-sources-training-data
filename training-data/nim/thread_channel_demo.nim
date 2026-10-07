# compile with: nim c --threads:on thread_channel_demo.nim
var chan: Channel[int]
chan.open()

proc producer(n: int) {.thread.} =
  for i in 1 .. n:
    chan.send(i * i)
  chan.send(-1)  # sentinel

var worker: Thread[int]
createThread(worker, producer, 5)

var total = 0
while true:
  let v = chan.recv()
  if v < 0: break
  echo "received ", v
  total += v

joinThread(worker)
chan.close()
echo "total = ", total
