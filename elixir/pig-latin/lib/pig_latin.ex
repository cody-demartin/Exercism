defmodule PigLatin do
  @vowels ["a", "e", "i", "o", "u"]
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    phrase
    |> String.split()
    |> Enum.map(&pig_latin(&1))
    |> Enum.join(" ")
  end

  defp pig_latin(word) do
    cond do
      String.starts_with?(word, @vowels) or x_or_y?(word) ->
        word <> "ay"

      String.contains?(word, "qu") ->
        qu(word) <> "ay"

      true ->
        consonants(word) <> "ay"
    end
  end

  defp x_or_y?(word) do
    String.first(word) in ["y", "x"] and String.at(word, 1) not in @vowels
  end

  defp qu(word) do
    [head | tail] =
      word
      |> String.split(~R/[{qu}?]/, include_captures: true, trim: true)
      |> Enum.reverse()

    [head | Enum.reverse(tail)]
    |> Enum.join()
  end

  defp consonants(word) do
    [head | tail] = String.split(word, ~R/[a|e|i|o|u|y|x1?]/, include_captures: true, trim: true)
    Enum.join(tail ++ [head])
  end
end
