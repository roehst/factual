# Factual

This is an example of an extremely lightweight event source implementation, fitting in less than 500 lines.

- It is entirelly sequential, providing strong consistency. - It is not designed for heavy loads.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `factual` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:factual, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/factual](https://hexdocs.pm/factual).
