defmodule Factual.Projections do
  alias Factual.{Event, Repo}

  @projections [
    Factual.Projections.User
  ]

  def update(event) do
    if shallow?(event) do
      {:ok, event} = Repo.insert(%Event{data: event})

      event_data = translate_atoms_to_strings(event.data)

      for projection <- @projections do
        projection.update(event_data)
      end
    else
      raise "Event must be a flat map, with no nested values"
    end
  end

  def reset() do
    for projection <- @projections do
      Repo.delete_all(projection)
    end

    events = Repo.all(Event)

    for e <- events do
      d = e.data

      for p <- @projections do
        p.update(d)
      end
    end
  end

  defp shallow?(event) do
    event
    |> Map.values()
    |> Enum.any?(&is_map/1)
    |> Kernel.then(fn x -> not x end)
  end

  defp translate_atoms_to_strings(event) do
    Enum.into(event, %{}, fn {k, v} -> {Atom.to_string(k), v} end)
  end
end
