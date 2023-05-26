defmodule IpMajor.Server do
  use GenServer

  # Client API

  def start_link([]) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def lookup(table, value) do
    case :ets.lookup(table, value) do
      [{_, token}] -> {:ok, token}
      [] -> {:error, table}
      end
    end
  def push(element) do
    GenServer.cast({:push, element}, state)
  end

  def pop() do
    GenServer.call(:pop, state)
  end

  def get_state() do
    GenServer.call(__MODULE__, :get_state)
  end

  # Server Callbacks

  def init(state) do
    :ets.new(:user, [:named_table, :public, :set, :protected])
    {:ok, state}
  end

  def handle_call(:get_state, _from, state) do
    {:reply, state, state}
  end

  def handle_call(:pop, _from, [head |tail]) do
    {:reply, head , tail}
  end
  def handle_cast({:push, element}, state) do
    {:noreply, [element | state]}
  end

end
