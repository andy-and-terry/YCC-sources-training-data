type
  Logger = ref object
    messages: seq[string]

var instance: Logger = nil

proc getLogger(): Logger =
  if instance == nil:
    instance = Logger(messages: @[])
  result = instance

proc log(logger: Logger, msg: string) =
  logger.messages.add(msg)

let logger1 = getLogger()
logger1.log("first message")

let logger2 = getLogger()
logger2.log("second message")

echo logger1 == logger2
echo logger1.messages
