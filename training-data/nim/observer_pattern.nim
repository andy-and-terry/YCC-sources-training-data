type
  Observer = ref object of RootObj

method notify(o: Observer, event: string) {.base.} =
  discard

type
  Logger = ref object of Observer
  Alerter = ref object of Observer

method notify(o: Logger, event: string) =
  echo "Logger received: ", event

method notify(o: Alerter, event: string) =
  echo "Alerter received: ", event

type
  Subject = object
    observers: seq[Observer]

proc attach(s: var Subject, o: Observer) =
  s.observers.add(o)

proc emit(s: Subject, event: string) =
  for o in s.observers:
    o.notify(event)

var subject: Subject
subject.attach(Logger())
subject.attach(Alerter())
subject.emit("started")
subject.emit("stopped")
