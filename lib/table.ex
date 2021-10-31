defmodule Table do
  def hello do
    print_map(Table.DataParser.get_data)
    loop()
  end

  def loop do
    inventory_data = Table.DataParser.get_data

    IO.puts("Request format: [chemical], [amount]")
    query = (IO.gets("What would you like to withdraw?\n")) |> String.replace_trailing("\n", "")

    query_line = String.split(query, ",")
    |> Enum.map(&String.trim/1)

    [query_chemical, query_amount] = query_line

    query_amount = query_amount |> String.to_float

    if !Map.has_key?(inventory_data, query_chemical) do
      IO.puts("[Reqest error]: Chemical not in list\n")
      loop()
    end

    inv_amount = Map.get(inventory_data, query_chemical)

    if query_amount > inv_amount do
      IO.puts("[Reqest error]: Cannot withdraw " <>
        Float.to_string(query_amount) <> " from " <>
        Float.to_string(inv_amount) <> "\n")
      loop()
    end

    new_amount = inv_amount - query_amount
    |> Float.ceil(5)

    inventory_data = Map.put(inventory_data, query_chemical, new_amount)
    Table.DataParser.put_data(inventory_data)

    print_map(inventory_data)

    loop()
  end

  def print_map(map) do
    longest_key = Map.keys(map)
    |> Stream.map(&String.length/1)
    |> Enum.max

    string_inv_data = Enum.map_join(map, "\n", fn {key, val} ->
      offset = longest_key - String.length(~s{#{key}})
      offset_spaces = String.duplicate(" ", offset)

      key = IO.ANSI.bright() <> key
      val = IO.ANSI.blue() <> Float.to_string(val |> Float.ceil(2)) <> IO.ANSI.reset()
      
      ~s{#{key},#{offset_spaces} #{val}}
    end)
    IO.puts("\nInventory:\n\n" <> string_inv_data <> "\n\n")
  end
end
