for i = 1, 10 do
  if i % 2 == 0 then goto skip end
  io.write(i, " ")
  ::skip::
end
print()

for i = 1, 3 do
  for j = 1, 3 do
    if i * j == 4 then goto done end
    io.write(i * j, " ")
  end
end
::done::
print("finished")
