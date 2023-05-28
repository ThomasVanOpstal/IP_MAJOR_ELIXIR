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
    GenServer.cast(__MODULE__, element)
  end

  def view() do
    GenServer.call(__MODULE__, :view)
  end

  def pop() do
    GenServer.call(__MODULE__,:pop)
  end

  def get_state() do
    GenServer.call(__MODULE__, :get_state)
  end

  # Server Callbacks

  def init(list) do
    :ets.new(:user, [:named_table, :public, :set, :protected])
    {:ok, list}
  end

  def handle_call(:get_state, _from, list) do
    {:reply, list, list}
  end

  def handle_call(:view, _from, list) do
    {:reply, list, list}
  end

  def handle_call(:pop, _from, []) do
    {:reply, nil, []}
  end

  def handle_call(:pop, _from, [head |tail]) do
    {:reply, head , tail}
  end

  def handle_cast(element, list) do
    updated_element = [element | list]
    {:noreply, updated_element}
  end

end
