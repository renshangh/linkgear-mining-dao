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
import * as receipt from "./transitions/sample_program_2025_03";

export class Sample_program_2025_03Contract extends BaseContract {

  constructor(config: Partial < ContractConfig > = {
    mode: ExecutionMode.LeoRun
  }) {
    super({
      ...config,
      appName: 'sample_program_2025_03',
      fee: '0.01',
      contractPath: 'artifacts/leo/sample_program_2025_03',
      isImportedAleo: false
    });
  }
  async main(r0: number, r1: number): Promise < TransactionResponse < TransactionModel & receipt.Sample_program_2025_03MainTransition, [number] >> {
    const r0Leo = js2leo.u32(r0);
    const r1Leo = js2leo.u32(r1);

    const params = [r0Leo, r1Leo]
    const result = await this.ctx.execute('main', params);
    result.set_converter_fn([leo2js.u32]);
    return result
  }


}