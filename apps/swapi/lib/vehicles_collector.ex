defmodule Swapi.VehiclesCollector do
  use GenServer
  alias Db.Repo
  alias Swapi.Vehicles

  def start_link(_) do
    GenServer.start_link(
      __MODULE__,
      [],
      name: __MODULE__
    )
  end

  def init(_opts) do
    {:ok, %{last_refresh: nil}, {:continue, :init}}
  end

  def handle_info(:refresh_cache, state) do
    refresh_cache()
    {:noreply, %{state | last_refresh: DateTime.utc_now()}}
  end

  def handle_info(_, state) do
    {:noreply, state}
  end

  def handle_continue(:init, state) do
    case Application.get_env(:swapi, :env) do
      :dev ->
        {:noreply, %{state | last_refresh: DateTime.utc_now()}}

      :prod ->
        schedule_init_poll()
        {:noreply, %{state | last_refresh: DateTime.utc_now()}}
    end
  end

  def refresh_cache() do
    Repo.delete_all(Swapi.Vehicles)

    stream_vehicles_from_swapi()
    |> Task.async_stream(&insert_or_update_postgres/1, timeout: :infinity)
    |> Stream.run()

    IO.puts("\n \n ======= Swapi Vehicles Refreshed ======= \n \n")
    schedule_poll()
    :ok
  end

  defp insert_or_update_postgres(swapi_vehicles) do
    try do
      existing = Repo.get_by!(Swapi.Vehicles, url: swapi_vehicles["url"])

      existing
      |> Vehicles.update(swapi_vehicles)
    rescue
      _ -> Vehicles.create(swapi_vehicles)
    end
  end

  defp schedule_poll do
    Process.send_after(self(), :refresh_cache, :timer.minutes(30))
  end

  defp schedule_init_poll do
    Process.send_after(self(), :refresh_cache, :timer.minutes(1))
  end

  defp stream_vehicles_from_swapi() do
    Swapi.stream_vehicles()
  end
end
