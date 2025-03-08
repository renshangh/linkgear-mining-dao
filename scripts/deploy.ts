import { Sample_programContract } from '../artifacts/js/sample_program_2025_03';

const contract = new Sample_programContract({
  networkName: 'testnet'
});

(async () => {
  const result = await contract.deploy();
  console.log(result);
})();
