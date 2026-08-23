defmodule Palindrome do
  def check?(str) do
    normalized =
      str
      |> String.downcase()
      |> String.replace(~r/[^a-z0-9]/, "")

    normalized == String.reverse(normalized)
  end
end

IO.inspect(Palindrome.check?("A man, a plan, a canal: Panama"))
IO.inspect(Palindrome.check?("hello"))
