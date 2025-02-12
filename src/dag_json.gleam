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
