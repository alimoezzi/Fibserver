# Fibserver

This `elixir` program creates a pool of processes which communicates with a dedicated `genserver` which calculates Fibonacci number using its `:get` interface. This is a synchronous call so the callee will get blocked until the calculation terminates.

The `Scheduler` module divides a list of input integer into chunks by the number desired process which is provided by user in when calling `run` method of `Scheduler` module.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `fibserver` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:fibserver, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/fibserver](https://hexdocs.pm/fibserver).

## How to run

> iex -S mix

> Scheduler.run(4, Scheduler, :schedule_processes, [30,31,32,33,34,35])
```
iex(2)> {30, 832040}
iex(2)> {31, 1346269}
iex(2)> {32, 2178309}
iex(2)> {33, 3524578}
iex(2)> {34, 5702887}
iex(2)> {35, 9227465}
iex(2)>
```