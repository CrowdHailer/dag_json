# dag_json

[![Package Version](https://img.shields.io/hexpm/v/dag_json)](https://hex.pm/packages/dag_json)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/dag_json/)

> The native JSON IPLD format is called DAG-JSON to disambiguate it from regular JSON. Most simple JSON objects are valid DAG-JSON. The primary differences are:
>
> - Bytes and Links are supported with special use of single-key ("/") map.
> - In limited cases, maps with the key "/" other than those used to encode Bytes and Links, are disallowed.
> - Maps are sorted by key.

```sh
gleam add dag_json@1
```

DAG-JSON is a specification of a binary format so `dag_json.encode` returns a `BitArray`
DAG-JSON is a valid JSON document so decode using the `json` library.
This library includes two decode helpers to return `BitArray` and `Cid` data types.

```gleam
import dag_json

pub fn encode() {
  dag_json.binary(<<1, 2>>)
  |> dag_json.encode
}

pub fn decoder() {
  use bytes <- decode.field("foo", dag_json.decode_bytes)
  use ref <- decode.field("link",dag_json.decode_cid)
  todo
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