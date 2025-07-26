# Monte Carlo Simulation Benchmark: Julia vs Python

This project is a minimal **proof-of-concept (PoC)** comparing Julia and Python performance on a computationally intensive task: **option pricing using Monte Carlo simulations**.

---

## Project Goals

- Show how Julia excels in high-performance numerical computing
- Compare with equivalent NumPy-based Python implementation
- Highlight clear speedups and clean syntax
- Share reproducible benchmarks and plots

---

## Problem: Option Pricing via Monte Carlo

We estimate the value of a European call option using the Black-Scholes model and simulate `N` paths of the terminal asset price.

### Equation:

\[
S_T = S_0 \cdot e^{(r - \frac{1}{2} \sigma^2) T + \sigma \sqrt{T} Z}
\]

where \( Z \sim \mathcal{N}(0,1) \)

---

## Results Summary

| Simulations | Python (NumPy) | Julia |
|-------------|----------------|--------|
| 1 million   | 0.55s          | 0.07s |
| 10 million  | 5.8s           | 0.72s |
| 100 million | 59.3s          | 6.9s  |

> With multithreading, Julia scales further linearly. Python (NumPy) hits a ceiling due to GIL.

See full results in [`benchmarks/results.md`](./benchmarks/results.md)

---

## Run It Yourself

### Prerequisites
- Julia ≥ 1.10
- Python ≥ 3.10 with NumPy

### Julia Setup
```bash
julia --project -e 'using Pkg; Pkg.instantiate()'
julia scripts/run_simulation.jl


