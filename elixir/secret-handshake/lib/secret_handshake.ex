defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    list = [
      "wink",
      "double blink",
      "close your eyes",
      "jump"
    ]

    digits = code
    |> Integer.digits(2)

    digits
    |> Enum.reverse()
    |> Enum.zip(list)
    |> Enum.reduce( [], fn { number, value }, acc -> is_present(number, value, acc) end)
    |> do_reverse(digits)
  end

  defp is_present(1, value, accumulator ), do: [ value | accumulator ]
  defp is_present(_, _, accumulator), do: accumulator

  defp do_reverse( list, [1 | t ] ) when length(t) == 4, do: list
  defp do_reverse(list, _ ), do: Enum.reverse(list)



end
