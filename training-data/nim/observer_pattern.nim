type
  Observer = ref object of RootObj

  Subject = ref object
    observers: seq[Observer]
    state: int

method notify(o: Observer, state: int) {.base.} =
  discard

type
  ConsoleObserver = ref object of Observer
    name: string

method notify(o: ConsoleObserver, state: int) =
  echo o.name, " received update: ", state

proc newSubject(): Subject =
  Subject(observers: @[], state: 0)

proc attach(s: Subject, o: Observer) =
  s.observers.add(o)

proc setState(s: Subject, state: int) =
  s.state = state
  for o in s.observers:
    o.notify(state)

let subject = newSubject()
subject.attach(ConsoleObserver(name: "A"))
subject.attach(ConsoleObserver(name: "B"))
subject.setState(42)
