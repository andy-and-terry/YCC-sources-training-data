import locks
var counter = 0
var lock: Lock
initLock(lock)

proc worker(id: int) {.thread.} =
  for _ in 0 ..< 1000:
    withLock lock:
      inc counter

var threads: array[4, Thread[int]]
for i in 0 ..< 4: createThread(threads[i], worker, i)
joinThreads(threads)
echo counter

var chan: Channel[int]
chan.open()
proc producer() {.thread.} =
  for i in 1 .. 3: chan.send(i * i)
var t: Thread[void]
createThread(t, producer)
joinThread(t)
var sum = 0
for _ in 1 .. 3: sum += chan.recv()
echo sum
chan.close()
