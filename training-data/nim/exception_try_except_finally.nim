try:
  raise newException(ValueError, "bad")
except ValueError as e:
  echo "caught ", e.msg
finally:
  echo "done"
