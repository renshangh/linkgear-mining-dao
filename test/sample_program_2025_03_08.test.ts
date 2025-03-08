import { Sample_program_2025_03Contract } from "../artifacts/js/sample_program_2025_03";

describe('Sample Program Tests', () => {
  test('main function test', async () => {
    const contract = new Sample_program_2025_03Contract();
    const response = await contract.main(1, 2);
    console.log(response); // Prints the response object

    // Extract the output from the transaction receipt
    const output = response.outputs[0]; // '3u32'
    const outputNumber = parseInt(output.replace('u32', ''), 10); // Convert to number

    expect(outputNumber).toBe(3);
  });
});