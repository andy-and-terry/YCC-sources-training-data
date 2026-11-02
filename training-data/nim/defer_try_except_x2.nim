proc risky() =
  try:
    raise newException(ValueError, "oops")
  except ValueError as e:
    echo "caught ", e.msg
  finally:
    echo "finally"

risky()
