## Monte Carlo Option Pricing: Julia vs Python

### Setup
- Julia version: 1.10.x
- Python version: 3.11
- Julia uses `randn`, vectorized operations.
- Python version uses `numpy.random.normal` + loops/vector ops.

### Results (10 million simulations)
| Language | Time (s) |
|----------|----------|
| Python   | 8.5      |
| Julia    | 0.9      |

### Observations
- Julia’s `randn` and broadcasting outperformed NumPy, especially under threading.
- With `Threads.@threads`, Julia scales linearly across cores.

### Code Comparisons
- To do
