use circuit::MyCircuit;
use halo2_proofs::{circuit::Value, dev::MockProver, pasta::Fp};

mod chip;
mod circuit;

fn main() {
    // The number of rows in our circuit cannot exceed 2^k. Since our example
    // circuit is very small, we can pick a very small value here.
    let k = 16;

    // Prepare the private and public inputs to the circuit!
    let a = Fp::from(1);
    let b = Fp::from(0);
    let c = Fp::from(17711);

    // Instantiate the circuit with the private inputs.
    let circuit = MyCircuit {
        a,
        b: Value::known(b),
        n: 22,
    };

    // Arrange the public input. We expose the multiplication result in row 0
    // of the instance column, so we position it there in our public inputs.
    let mut public_inputs = vec![c];

    // Given the correct public input, our circuit will verify.
    let prover = MockProver::run(k, &circuit, vec![public_inputs.clone()]).unwrap();

    use plotters::prelude::*;
    let root = BitMapBackend::new("layout.png", (1024, 768)).into_drawing_area();
    root.fill(&WHITE).unwrap();
    let root = root
        .titled("Example Circuit Layout", ("sans-serif", 60))
        .unwrap();

    halo2_proofs::dev::CircuitLayout::default()
        // You can optionally render only a section of the circuit.
        .view_width(0..4)
        .view_height(0..32)
        // You can hide labels, which can be useful with smaller areas.
        .show_labels(true)
        // Render the circuit onto your area!
        // The first argument is the size parameter for the circuit.
        .render(k, &circuit, &root)
        .unwrap();

    assert_eq!(prover.verify(), Ok(()));

    // If we try some other public input, the proof will fail!
    public_inputs[0] += Fp::one();
    let prover = MockProver::run(k, &circuit, vec![public_inputs]).unwrap();
    assert!(prover.verify().is_err());
}

#[test]
fn test_circuit_1() {
    let circuit = MyCircuit {
        a: Fp::from(1),
        b: Value::known(Fp::from(0)),
        n: 1,
    };

    let public_inputs = vec![Fp::from(1)];
    let prover = MockProver::run(4, &circuit, vec![public_inputs.clone()]).unwrap();

    assert_eq!(prover.verify(), Ok(()));
}

#[test]
fn test_circuit_2() {
    let circuit = MyCircuit {
        a: Fp::from(1),
        b: Value::known(Fp::from(0)),
        n: 2,
    };

    let public_inputs = vec![Fp::from(1)];
    let prover = MockProver::run(4, &circuit, vec![public_inputs.clone()]).unwrap();

    assert_eq!(prover.verify(), Ok(()));
}

#[test]
fn test_circuit_3() {
    let circuit = MyCircuit {
        a: Fp::from(1),
        b: Value::known(Fp::from(0)),
        n: 3,
    };

    let public_inputs = vec![Fp::from(2)];
    let prover = MockProver::run(4, &circuit, vec![public_inputs.clone()]).unwrap();

    assert_eq!(prover.verify(), Ok(()));
}

#[test]
fn test_circuit_4() {
    let circuit = MyCircuit {
        a: Fp::from(1),
        b: Value::known(Fp::from(0)),
        n: 4,
    };

    let public_inputs = vec![Fp::from(3)];
    let prover = MockProver::run(5, &circuit, vec![public_inputs.clone()]).unwrap();

    assert_eq!(prover.verify(), Ok(()));
}

#[test]
fn test_circuit_5() {
    let circuit = MyCircuit {
        a: Fp::from(1),
        b: Value::known(Fp::from(0)),
        n: 5,
    };

    let public_inputs = vec![Fp::from(5)];
    let prover = MockProver::run(6, &circuit, vec![public_inputs.clone()]).unwrap();

    assert_eq!(prover.verify(), Ok(()));
}

#[test]
fn test_circuit_22() {
    let circuit = MyCircuit {
        a: Fp::from(1),
        b: Value::known(Fp::from(0)),
        n: 22,
    };

    let public_inputs = vec![Fp::from(17711)];
    let prover = MockProver::run(16, &circuit, vec![public_inputs.clone()]).unwrap();

    assert_eq!(prover.verify(), Ok(()));
}
