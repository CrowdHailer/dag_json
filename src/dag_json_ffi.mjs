import { toBitArray,Ok,Error } from "../gleam_stdlib/gleam.mjs"
import * as dagJSON from "@ipld/dag-json";

export function code() {
  return dagJSON.code
}

export function name() {
  return dagJSON.name
}

export function encode(node) {
  return toBitArray(dagJSON.encode(node))
}

export function decode(data) {
  try {
    return new Ok(dagJSON.decode(data.buffer))
  } catch (error) {
    return new Error(`${error}`)
  }
}