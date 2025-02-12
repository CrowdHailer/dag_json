# dag_json

Bindings to the [js implementation](https://github.com/ipld/js-dag-json) of dag-json.

[![Package Version](https://img.shields.io/hexpm/v/dag_json)](https://hex.pm/packages/dag_json)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/dag_json/)

```sh
npm install --save @ipld/dag-json@10
gleam add dag_json@1
```
```gleam
import dag_json as codec
import gleam/json

pub fn code_test() {
  codec.code()
  |> should.equal(297)
}

pub fn name_test() {
  codec.name()
  |> should.equal("dag-json")
}

pub fn encode() {
  json.array([2], json.int)
  |> codec.encode
}

pub fn decode() {
  <<"{\"bar\":\"baz\"}">>
  |> codec.decode
}
```

Further documentation can be found at <https://hexdocs.pm/dag_json>.

## Development

```sh
gleam run   # Run the project
gleam test  # Run the tests
```

## Credit

Created for [EYG](https://eyg.run/), a new integration focused programming language.