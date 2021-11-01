# Table

**Chemical Storeroom Written in Elixir**

Displays chemical inventory with amounts of each

Usage:
$ [chemical name], amount
To withdraw that amount and the inventory will update.

Attempt to withdraw more than there is in the inventory,
and it will return with an error


How to run app:
$ mix withdraw


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `table` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:table, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/table](https://hexdocs.pm/table).

