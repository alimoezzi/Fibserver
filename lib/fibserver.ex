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

defmodule Scheduler do
  def run(num_processes, module, func, to_calculate) do
    pids =
      1..num_processes
      |> Enum.map(fn _ ->
        {:ok, pid} = Fibserver.start_link([])
        pid
      end)

    chunks_to_calculate = chunker(to_calculate, num_processes)

    Enum.zip(pids, chunks_to_calculate)
    |> Enum.map(fn {pid, chunk_to_calculate} ->
      spawn(module, func, [pid, chunk_to_calculate])
    end)
  end

  def schedule_processes(pid, chunk_to_calculate) when length(chunk_to_calculate) > 0 do
    Fibserver.start(pid)
    [head | tail] = chunk_to_calculate
    IO.inspect({head, Fibserver.get(pid, head)})
    schedule_processes(pid, tail)
  end

  def schedule_processes(pid, _chunk_to_calculate) do
    Fibserver.end_server(pid)
  end

  # utils
  defp chunker(list, parts), do: do_chunk(list, parts, [])

  defp do_chunk(_, 0, chunks), do: chunks

  defp do_chunk(to_chunk, parts, chunks) do
    chunk_length = to_chunk |> length() |> div(parts)
    {chunk, rest} = Enum.split(to_chunk, chunk_length)
    do_chunk(rest, parts - 1, [chunk | chunks])
  end
end
