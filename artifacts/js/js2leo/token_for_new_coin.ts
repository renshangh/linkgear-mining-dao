import {
  token,
  tokenLeo
} from "../types/token_for_new_coin";
import {
  js2leo
} from "@doko-js/core";


export function gettokenLeo(token: token): tokenLeo {
  const result: tokenLeo = {
    owner: js2leo.privateField(js2leo.address(token.owner)),
    amount: js2leo.privateField(js2leo.u64(token.amount)),
    _nonce: js2leo.publicField(js2leo.group(token._nonce)),
  }
  return result;
}