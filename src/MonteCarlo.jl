module MonteCarlo

using Distributions

"""
Simulate `n` paths of terminal asset price using Black-Scholes
"""
function simulate_option_price(n::Int; S0=100.0, K=100.0, r=0.05, σ=0.2, T=1.0)
    dt = T
    Z = randn(n)
    ST = S0 .* exp.((r - 0.5 * σ^2) * dt .+ σ * sqrt(dt) .* Z)
    payoff = max.(ST .- K, 0.0)
    return exp(-r * T) * mean(payoff)
end

end # module
