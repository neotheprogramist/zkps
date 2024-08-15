use halo2_proofs::{
    arithmetic::Field,
    circuit::{Layouter, SimpleFloorPlanner, Value},
    plonk::{Circuit, ConstraintSystem, Error},
};

use crate::chip::{FieldChip, FieldConfig, Number, NumericInstructions};

/// The full circuit implementation.
///
/// In this struct we store the private input variables. We use `Option<F>` because
/// they won't have any value during key generation. During proving, if any of these
/// were `None` we would get an error.
#[derive(Default)]
pub struct MyCircuit<F: Field> {
    pub a: F,
    pub b: Value<F>,
    pub n: usize,
}

impl<F: Field> Circuit<F> for MyCircuit<F> {
    // Since we are using a single chip for everything, we can just reuse its config.
    type Config = FieldConfig;
    type FloorPlanner = SimpleFloorPlanner;

    fn without_witnesses(&self) -> Self {
        Self::default()
    }

    fn configure(meta: &mut ConstraintSystem<F>) -> Self::Config {
        // We create the two advice columns that FieldChip uses for I/O.
        let advice = [meta.advice_column(), meta.advice_column()];

        // We also need an instance column to store public inputs.
        let instance = meta.instance_column();

        // Create a fixed column to load constants.
        let constant = meta.fixed_column();

        FieldChip::configure(meta, advice, instance, constant)
    }

    fn synthesize(
        &self,
        config: Self::Config,
        mut layouter: impl Layouter<F>,
    ) -> Result<(), Error> {
        let field_chip = FieldChip::<F>::construct(config);

        // Load the constant factor into the circuit.
        let a = field_chip.load_constant(layouter.namespace(|| "load constant b"), self.a)?;

        // Load our private values into the circuit.
        let b = field_chip.load_private(layouter.namespace(|| "load a"), self.b)?;

        let (a, _) = fib(self.n - 1, a, b, &field_chip, &mut layouter)?;

        // Expose the result as a public input to the circuit.
        field_chip.expose_public(layouter.namespace(|| "expose c"), a, 0)
    }
}

fn fib<F>(
    n: usize,
    a: Number<F>,
    b: Number<F>,
    chip: &FieldChip<F>,
    layouter: &mut impl Layouter<F>,
) -> Result<(Number<F>, Number<F>), Error>
where
    F: Field,
{
    if n == 0 {
        return Ok((a, b));
    }

    let (a, b) = fib(n - 1, a, b, chip, layouter)?;

    chip.switch_add(layouter.namespace(|| format!("add {}", n)), a, b)
}
