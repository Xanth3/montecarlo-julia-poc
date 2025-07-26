import numpy as np
import time

def simulate_option_price(n, S0=100.0, K=100.0, r=0.05, sigma=0.2, T=1.0):
    dt = T
    Z = np.random.randn(n)
    ST = S0 * np.exp((r - 0.5 * sigma**2) * dt + sigma * np.sqrt(dt) * Z)
    payoff = np.maximum(ST - K, 0)
    return np.exp(-r * T) * np.mean(payoff)

if __name__ == "__main__":
    N = 10_000_000
    start = time.time()
    price = simulate_option_price(N)
    end = time.time()
    print(f"Estimated option price: ${price:.4f}")
    print(f"Time taken: {end - start:.3f} seconds")
