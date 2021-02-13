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

