defmodule Mix.Tasks.Withdraw do
  @moduledoc "Starts table interface loop"
  @shortdoc "Starts loop"

  use Mix.Task

  @impl Mix.Task
  def run(_args) do
    Table.hello()
  end
end
