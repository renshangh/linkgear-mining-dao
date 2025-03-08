import {
  tx
} from "@doko-js/core";


export type Test001MainTransition = tx.ExecutionReceipt < [tx.Transition < [tx.PrivateOutput], 'test001', 'main' > , ] >