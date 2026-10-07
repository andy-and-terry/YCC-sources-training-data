# compile with: nim c --threads:on channels_threads_demo.nim
var chan: Channel[int]
chan.open()

proc producer() {.thread.} =
  for i in 1 .. 5:
    chan.send(i * i)
  chan.send(-1)

var t: Thread[void]
createThread(t, producer)

while true:
  let v = chan.recv()
  if v < 0: break
  echo "got ", v
joinThread(t)
chan.close()
