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

end
