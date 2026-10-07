employees <- data.frame(
  id = c(1, 2, 3),
  name = c("Ada", "Bob", "Cleo")
)

departments <- data.frame(
  id = c(1, 2, 4),
  department = c("eng", "sales", "hr")
)

print(merge(employees, departments, by = "id"))
print(merge(employees, departments, by = "id", all.x = TRUE))
print(merge(employees, departments, by = "id", all = TRUE))
