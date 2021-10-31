defmodule Table.DataParser do
  @inventory_filepath "inventory.txt"

  def get_data do
    data_rows = File.read!(@inventory_filepath) |> String.split("\n")

    data_rows
    |> Stream.map(&trim_row(&1))
    |> Stream.filter(&check_data_row?(&1))
    |> Stream.map(&format_row(&1))
    |> Enum.into(%{})
  end

  def put_data(map) do
    string_data = Enum.map_join(map, "\n", fn {key, val} -> ~s{#{key}, #{val}} end)

    File.write(@inventory_filepath, string_data)
  end

  def trim_row(row) do
    String.split(row, ",")
    |> Enum.map(&String.trim/1)
  end

  defp check_data_row?(row) do
    case row do
      [_chemical, _amount] -> true
      _ -> false
    end
  end

  def format_row(row) do
    [chemical, amount] = row
    amount = amount |> String.to_float
    {chemical, amount}
  end
end
