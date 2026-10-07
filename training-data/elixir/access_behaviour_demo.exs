defmodule ConfigStore do
  defstruct settings: %{}

  @behaviour Access

  @impl true
  def fetch(%ConfigStore{settings: settings}, key) do
    Map.fetch(settings, key)
  end

  @impl true
  def get_and_update(%ConfigStore{settings: settings} = store, key, fun) do
    {value, new_settings} = Map.get_and_update(settings, key, fun)
    {value, %ConfigStore{store | settings: new_settings}}
  end

  @impl true
  def pop(%ConfigStore{settings: settings} = store, key) do
    {value, new_settings} = Map.pop(settings, key)
    {value, %ConfigStore{store | settings: new_settings}}
  end
end

store = %ConfigStore{settings: %{env: "production", region: "us-east"}}

IO.inspect(store[:env])
IO.inspect(store[:missing])
IO.inspect(get_in(store, [:region]))

{value, updated} = pop_in(store, [:region])
IO.inspect(value)
IO.inspect(updated[:region])
