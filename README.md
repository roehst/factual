# Factual

This is an example of an extremely lightweight event source implementation, fitting in less than 500 lines.

The key design choice was to keep the code synchronous, without introducing a pub sub or event bus.

The overall architecture is simple:

- Commands are validated against projections.
- Commands emit events.
- Events update projections.

As such:

- It is entirelly sequential, providing strong consistency.
- It is not designed for heavy loads.

Ecto is used for storing events.
