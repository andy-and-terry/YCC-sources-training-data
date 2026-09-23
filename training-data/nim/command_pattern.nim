type
  Command = object
    execute: proc ()
    undo: proc ()

var total = 0
var history: seq[Command] = @[]

proc makeAddCommand(amount: int): Command =
  Command(
    execute: proc () = total += amount,
    undo: proc () = total -= amount
  )

proc run(cmd: Command) =
  cmd.execute()
  history.add(cmd)

proc undoLast() =
  if history.len > 0:
    let cmd = history.pop()
    cmd.undo()

run(makeAddCommand(5))
run(makeAddCommand(10))
echo total
undoLast()
echo total
