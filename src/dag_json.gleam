import gleam/bit_array
import gleam/dynamic/decode
import gleam/json.{type Json}
import gleam/list
import multiformats/cid/v1
import multiformats/hashes

pub fn code() -> Int {
  297
}

pub fn name() -> String {
  "dag-json"
}

pub fn encode(node: Json) -> BitArray {
  node
  |> json.to_string()
  |> bit_array.from_string()
}

pub fn binary(bytes) {
  let encoded = bit_array.base64_encode(bytes, False)
  json.object([#("/", json.object([#("bytes", json.string(encoded))]))])
}

pub fn cid(cid) {
  json.object([#("/", json.string(cid))])
}

pub const bool = json.bool

pub const string = json.string

pub const int = json.int

pub const float = json.float

pub const null = json.null

pub const nullable = json.nullable

pub fn object(entries) {
  list.sort(entries, fn(a, b) {
    let #(key_a, _value) = a
    let #(key_b, _value) = b
    bit_array.compare(
      bit_array.from_string(key_a),
      bit_array.from_string(key_b),
    )
  })
  |> json.object
}

pub const array = json.preprocessed_array

pub fn decode_bytes() {
  use bytes <- decode.field("/", {
    use encoded <- decode.field("bytes", decode.string)
    case bit_array.base64_decode(encoded) {
      Ok(bytes) -> decode.success(bytes)
      Error(_) -> decode.failure(<<>>, "Invalid base64")
    }
  })
  decode.success(bytes)
}

pub fn decode_cid() {
  use cid <- decode.field("/", decode.string)
  case v1.from_string(cid) {
    Ok(#(cid, _)) -> decode.success(cid)
    Error(reason) ->
      decode.failure(v1.Cid(0, hashes.Multihash(hashes.Sha256, <<>>)), reason)
  }
}
