// The 'sample_program' program.
program sample_program_2025_03.aleo {
    transition main(public a: u32, b: u32) -> u32 {
        let c: u32 = a + b;
        return c;
    }
}