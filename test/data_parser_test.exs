defmodule Table.DataParserTest do
  use ExUnit.Case
  alias Table.DataParser
  doctest Table

  test "get_data/0" do
    inventory_data = DataParser.get_data
    amount = Map.get(inventory_data, "Hydrochloric Acid")
    assert is_float(amount)
  end

  test "put_data/1" do
    inventory_data = DataParser.get_data
    assert DataParser.put_data(inventory_data) == :ok
  end

end
