defmodule ExcelColumn do
  def title(0), do: ""
  def title(n), do: title(div(n - 1, 26)) <> <<?A + rem(n - 1, 26)>>
end

IO.puts("#{ExcelColumn.title(28)} #{ExcelColumn.title(701)}") # AB ZY
