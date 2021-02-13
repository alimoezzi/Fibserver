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

  def end_server(pid) do
    GenServer.stop(pid, :normal)
  end


  def handle_call(:start, _from, state) do
    {:reply, :ready, state}
  end

  def handle_call({:get, n}, _from, state) do
    {:reply, do_fib(n), state}
  end

  defp do_fib(n) do
    case n do
      0 -> 0
      1 -> 1
      _ -> do_fib(n - 1) + do_fib(n - 2)
    end
  end
end
end
