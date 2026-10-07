proc demo(fail: bool) =
  echo "start"
  defer: echo "cleanup A"
  defer: echo "cleanup B"

  if fail:
    echo "failing early"
    return
  echo "normal path"

demo(false)
echo "---"
demo(true)
