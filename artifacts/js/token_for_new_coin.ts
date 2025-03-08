import {
  token
} from "./types/token_for_new_coin";
import {
  gettokenLeo
} from "./js2leo/token_for_new_coin";
import {
  gettoken
} from "./leo2js/token_for_new_coin";
import {
  ContractConfig,
  zkGetMapping,
  LeoAddress,
  LeoRecord,
  js2leo,
  leo2js,
  ExternalRecord,
  ExecutionMode,
  ExecutionContext,
  CreateExecutionContext,
  TransactionResponse
} from "@doko-js/core";
import {
  BaseContract
} from "../../contract/base-contract";
import {
  TransactionModel
} from "@provablehq/sdk";
import * as receipt from "./transitions/token_for_new_coin";

export class Token_for_new_coinContract extends BaseContract {

  constructor(config: Partial < ContractConfig > = {
    mode: ExecutionMode.LeoRun
  }) {
    super({
      ...config,
      appName: 'token_for_new_coin',
      fee: '0.01',
      contractPath: 'artifacts/leo/token_for_new_coin',
      isImportedAleo: false
    });
  }
  async mint_public(r0: LeoAddress, r1: bigint): Promise < TransactionResponse < TransactionModel & receipt.Token_for_new_coinMint_publicTransition, [] >> {
    const r0Leo = js2leo.address(r0);
    const r1Leo = js2leo.u64(r1);

    const params = [r0Leo, r1Leo]
    const result = await this.ctx.execute('mint_public', params);
    return result
  }

  async mint_private(r0: LeoAddress, r1: bigint): Promise < TransactionResponse < TransactionModel & receipt.Token_for_new_coinMint_privateTransition, [LeoRecord] >> {
    const r0Leo = js2leo.address(r0);
    const r1Leo = js2leo.u64(r1);

    const params = [r0Leo, r1Leo]
    const result = await this.ctx.execute('mint_private', params);
    result.set_converter_fn([leo2js.record]);
    return result
  }

  async transfer_public(r0: LeoAddress, r1: bigint): Promise < TransactionResponse < TransactionModel & receipt.Token_for_new_coinTransfer_publicTransition, [] >> {
    const r0Leo = js2leo.address(r0);
    const r1Leo = js2leo.u64(r1);

    const params = [r0Leo, r1Leo]
    const result = await this.ctx.execute('transfer_public', params);
    return result
  }

  async transfer_private(r0: token, r1: LeoAddress, r2: bigint): Promise < TransactionResponse < TransactionModel & receipt.Token_for_new_coinTransfer_privateTransition, [LeoRecord, LeoRecord] >> {
    const r0Leo = js2leo.json(gettokenLeo(r0));
    const r1Leo = js2leo.address(r1);
    const r2Leo = js2leo.u64(r2);

    const params = [r0Leo, r1Leo, r2Leo]
    const result = await this.ctx.execute('transfer_private', params);
    result.set_converter_fn([leo2js.record, leo2js.record]);
    return result
  }

  async transfer_private_to_public(r0: token, r1: LeoAddress, r2: bigint): Promise < TransactionResponse < TransactionModel & receipt.Token_for_new_coinTransfer_private_to_publicTransition, [LeoRecord] >> {
    const r0Leo = js2leo.json(gettokenLeo(r0));
    const r1Leo = js2leo.address(r1);
    const r2Leo = js2leo.u64(r2);

    const params = [r0Leo, r1Leo, r2Leo]
    const result = await this.ctx.execute('transfer_private_to_public', params);
    result.set_converter_fn([leo2js.record]);
    return result
  }

  async transfer_public_to_private(r0: LeoAddress, r1: bigint): Promise < TransactionResponse < TransactionModel & receipt.Token_for_new_coinTransfer_public_to_privateTransition, [LeoRecord] >> {
    const r0Leo = js2leo.address(r0);
    const r1Leo = js2leo.u64(r1);

    const params = [r0Leo, r1Leo]
    const result = await this.ctx.execute('transfer_public_to_private', params);
    result.set_converter_fn([leo2js.record]);
    return result
  }

  async account(key: LeoAddress, defaultValue ? : bigint): Promise < bigint > {
    const keyLeo = js2leo.address(key);

    const params = [keyLeo]
    const result = await zkGetMapping(
      this.config,
      'account',
      params[0],
    );

    if (result != null)
      return leo2js.u64(result);
    else {
      if (defaultValue != undefined) return defaultValue;
      throw new Error(`account returned invalid value[input: ${key}, output: ${result}`);
    }
  }


}