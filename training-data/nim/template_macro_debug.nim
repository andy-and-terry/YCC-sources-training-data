template debug(msg: string, body: untyped) =
  echo "[start] ", msg
  body
  echo "[end] ", msg

debug "work":
  echo 1 + 2
