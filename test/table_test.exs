defmodule TableTest do
  use ExUnit.Case
  doctest Table

  test "parse_input/1 Happy Path" do
    [_inventory_data, query_chemical, query_amount] = Table.parse_input("Water, 1.0")
    assert query_chemical == "Water"
    assert query_amount == 1.0
  end

  test "parse_input/1 No Delimiter" do
    [_inventory_data, query_chemical, query_amount] = Table.parse_input("Water 1.0")
    assert query_chemical == "Water"
    assert query_amount == 1.0
  end

  test "parse_input/1 Integer Input" do
    [_inventory_data, query_chemical, query_amount] = Table.parse_input("Water, 1")
    assert query_chemical == "Water"
    assert query_amount == 1.0
  end
end
