using MonteCarlo
using Plots
using Dates

@time begin
    N = 10_000_000
    price = MonteCarlo.simulate_option_price(N)
    println("Estimated option price: \$$(round(price, digits=4))")
end
