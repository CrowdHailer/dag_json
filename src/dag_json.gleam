import gleam/bit_array
import gleam/dynamic.{type Dynamic}
import gleam/json.{type Json}

@external(javascript, "./dag_json_ffi.mjs", "code")
pub fn code() -> Int

@external(javascript, "./dag_json_ffi.mjs", "name")
pub fn name() -> String

@external(javascript, "./dag_json_ffi.mjs", "encode")
pub fn encode(node: Json) -> BitArray

@external(javascript, "./dag_json_ffi.mjs", "decode")
pub fn decode(data: BitArray) -> Result(Dynamic, String)

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

pub const object = json.object

pub const array = json.preprocessed_array
