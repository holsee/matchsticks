defmodule Matchsticks do
  @big 50
  @medium 20
  @small 5

  @doc """
  The function will calculate the number of boxes necessary to accommodate some matchsticks.
  It returns a map with the number of boxes necessary for each type of box.
  The factory has three types of boxes: the big ones hold fifty matchsticks,
  the medium ones hold twenty, and the small ones hold five.
  The boxes can't have fewer matchstick that they can hold; they must be full.
  The returning map should contain the remaining matchsticks. It should work like this:

  ## Examples

     iex> Matchsticks.boxes(98)
     %{big: 1, medium: 2, remaining_matchsticks: 3, small: 1}

     iex> Matchsticks.boxes(39)
     %{big: 0, medium: 1, remaining_matchsticks: 4, small: 3}

     iex> Matchsticks.boxes(50)
     %{big: 1, medium: 0, remaining_matchsticks: 0, small: 0}

  """
  def boxes(num) when is_integer(num) do
    boxes(%{big: 0, medium: 0, small: 0, remaining_matchsticks: num})
  end

  def boxes(agg = %{remaining_matchsticks: num}) when num >= @big do
    count = div(num, @big)
    remaining = num - (@big * count)
    boxes(%{agg | big: count, remaining_matchsticks: remaining})
  end

  def boxes(agg = %{remaining_matchsticks: num}) when num >= @medium do
    count = div(num, @medium)
    remaining = num - (@medium * count)
    boxes(%{agg | medium: count, remaining_matchsticks: remaining})
  end

  def boxes(agg = %{remaining_matchsticks: num}) when num >= @small do
    count = div(num, @small)
    remaining = num - (@small * count)
    boxes(%{agg | small: count, remaining_matchsticks: remaining})
  end

  def boxes(agg), do: agg
end
