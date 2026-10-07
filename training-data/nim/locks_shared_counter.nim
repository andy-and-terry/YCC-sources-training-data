# compile with: nim c --threads:on locks_shared_counter.nim
import std/locks

var
  lock: Lock
  counter {.guard: lock.} = 0
  threads: array[4, Thread[void]]

proc work() {.thread.} =
  for _ in 1 .. 1000:
    withLock lock:
      inc counter

initLock(lock)
for t in threads.mitems: createThread(t, work)
joinThreads(threads)
withLock lock:
  echo counter
deinitLock(lock)
