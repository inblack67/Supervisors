defmodule Sups do
  use GenServer

  def init(init_arg) do
    {:ok, init_arg}
  end

  def start_link(state \\ []) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def handle_call(:dequeue, _from, [value | rest]) do
    # {:reply, :reply, :newstate}
    {:reply, value, rest}
  end

  def handle_call(:dequeue, _from, []) do
    {:reply, nil, []}
  end

  def handle_call(:queue, _from, state) do
    {:reply, state, state}
  end

  # async => does not reply
  def handle_cast({:enqueue, data}, state) do
    new_state = [data | state]
    {:noreply, new_state}
  end

  def queue, do: GenServer.call(__MODULE__, :queue)
  def dequeue, do: GenServer.call(__MODULE__, :dequeue)

  def enqueue(data), do: GenServer.cast(__MODULE__, {:enqueue, data})
end
