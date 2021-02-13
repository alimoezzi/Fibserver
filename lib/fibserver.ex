defmodule Fibserver do
  use GenServer

  # client side
  def start_link(_) do
    GenServer.start_link(__MODULE__, [])
  end
  # server side /callback functions
  def init(init) do
    # Trap exits
    Process.flag(:trap_exit, true)
    {:ok, init}
  end

  def start(pid) do
    GenServer.call(pid, :start)
  end

  def get(pid, n) do
    GenServer.call(pid, {:get, n})
  end

end
