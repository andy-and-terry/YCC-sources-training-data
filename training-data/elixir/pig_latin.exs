defmodule PigLatin do
  @vowel_start ~r/^([aeiou]|xr|yt)/
  @consonant ~r/^([^aeiou]*qu|[^aeiou]+?(?=y)|[^aeiou]+)(.*)$/

  def translate(phrase) do
    phrase |> String.downcase() |> String.split() |> Enum.map_join(" ", &word/1)
  end

  defp word(w) do
    cond do
      w =~ @vowel_start -> w <> "ay"
      match = Regex.run(@consonant, w) -> [_, head, tail] = match; tail <> head <> "ay"
      true -> w <> "ay"
    end
  end
end

IO.puts(PigLatin.translate("quick fast run apple rhythm square"))
