import {
  tx
} from "@doko-js/core";
import * as records from "../types/token_for_new_coin";


export type Token_for_new_coinMint_publicTransition = tx.ExecutionReceipt < [tx.Transition < [tx.FutureOutput], 'token_for_new_coin', 'mint_public' > , ] >
  export type Token_for_new_coinMint_privateTransition = tx.ExecutionReceipt < [tx.Transition < [tx.RecordOutput < records.token > ], 'token_for_new_coin', 'mint_private' > , ] >
  export type Token_for_new_coinTransfer_publicTransition = tx.ExecutionReceipt < [tx.Transition < [tx.FutureOutput], 'token_for_new_coin', 'transfer_public' > , ] >
  export type Token_for_new_coinTransfer_privateTransition = tx.ExecutionReceipt < [tx.Transition < [tx.RecordOutput < records.token > , tx.RecordOutput < records.token > ], 'token_for_new_coin', 'transfer_private' > , ] >
  export type Token_for_new_coinTransfer_private_to_publicTransition = tx.ExecutionReceipt < [tx.Transition < [tx.RecordOutput < records.token > , tx.FutureOutput], 'token_for_new_coin', 'transfer_private_to_public' > , ] >
  export type Token_for_new_coinTransfer_public_to_privateTransition = tx.ExecutionReceipt < [tx.Transition < [tx.RecordOutput < records.token > , tx.FutureOutput], 'token_for_new_coin', 'transfer_public_to_private' > , ] >