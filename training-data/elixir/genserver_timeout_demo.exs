defmodule Heartbeat do
  use GenServer

  def start_link(interval_ms), do: GenServer.start_link(__MODULE__, interval_ms)

  def ticks(pid), do: GenServer.call(pid, :ticks)

  @impl true
  def init(interval_ms) do
    schedule_tick(interval_ms)
    {:ok, %{interval: interval_ms, ticks: 0}}
  end

  @impl true
  def handle_info(:tick, state) do
    schedule_tick(state.interval)
    {:noreply, %{state | ticks: state.ticks + 1}}
  end

  @impl true
  def handle_call(:ticks, _from, state) do
    {:reply, state.ticks, state}
  end

  defp schedule_tick(interval_ms) do
    Process.send_after(self(), :tick, interval_ms)
  end
end

{:ok, pid} = Heartbeat.start_link(10)
Process.sleep(55)
ticks = Heartbeat.ticks(pid)
IO.inspect(ticks >= 3)
