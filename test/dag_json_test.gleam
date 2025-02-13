import dag_json as codec
import gleam/json
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn code_test() {
  codec.code()
  |> should.equal(297)
}

pub fn name_test() {
  codec.name()
  |> should.equal("dag-json")
}

pub fn encode_test() {
  json.array([2], json.int)
  |> codec.encode
  |> should.equal(<<"[2]">>)
}

pub fn decode_test() {
  <<"{\"bar\":\"baz\"}">>
  |> codec.decode
  |> should.be_ok()
}

pub fn invalid_decode_test() {
  <<"{\"/\":\"foo\",\"bar\":\"baz\"}">>
  |> codec.decode
  |> should.equal(Error("Error: Invalid encoded CID form"))
}

pub fn encode_binary_test() {
  codec.binary(<<>>)
  |> json.to_string
  |> should.equal("{\"/\":{\"bytes\":\"\"}}")
}
