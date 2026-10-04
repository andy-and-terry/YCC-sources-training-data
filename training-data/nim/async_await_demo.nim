import std/asyncdispatch

proc fetchValue(id: int, delayMs: int): Future[int] {.async.} =
  await sleepAsync(delayMs)
  echo "task ", id, " finished"
  return id * 10

proc main() {.async.} =
  # start tasks concurrently; the shortest delay completes first
  let a = fetchValue(1, 120)
  let b = fetchValue(2, 40)
  let c = fetchValue(3, 80)
  let results = await all(a, b, c)
  echo "results: ", results

waitFor main()
