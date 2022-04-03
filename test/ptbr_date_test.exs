defmodule PtbrDateTest do
  use ExUnit.Case
  doctest PtbrDate

  test "Test now()\0" do
    assert PtbrDate.now() == :calendar.local_time
  end

  test "test format()\2 with date" do
    assert {:date, {1999, 3, 2}} |> PtbrDate.format == "02031999"
  end

  test "test format()\2 with time" do
    assert {:time, {18, 5, 2}} |> PtbrDate.format == "180502"
  end

  test "test always return a string" do
    {date, time} = PtbrDate.now
    assert PtbrDate.format({:date, date}) |> is_binary
    assert PtbrDate.format({:date, time}) |> is_binary
  end
end
