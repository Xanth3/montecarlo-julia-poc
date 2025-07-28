push!(LOAD_PATH, joinpath(@__DIR__, "..", "src"))

using MonteCarlo          # local module
using StatsPlots
using DataFrames
using Statistics          # for mean()
using CategoricalArrays

# Simulation sizes
Ns = [1_000_000, 5_000_000, 10_000_000]
labels = Dict("1000000" => "1M", "5000000" => "5M", "10000000" => "10M")

# Python benchmark averages
python_times = [0.029, 0.105, 0.196]

# Benchmark Julia
julia_times = Float64[]
for N in Ns
    println("Running Julia simulation with N = $N")
    times = [@elapsed MonteCarlo.simulate_option_price(N) for _ in 1:3]
    avg = mean(times)
    push!(julia_times, avg)
    println("Julia times: ", times)
    println("Average Julia time: ", round(avg, digits=6), "s")
end

# Construct long-form DataFrame
labels = ["1M", "5M", "10M"]
df = DataFrame(
    Label = repeat(labels, inner=2),
    lang = repeat(["Julia", "Python"], outer=3),
    time = Iterators.flatten(zip(julia_times, python_times)) |> collect
)
df.Label = CategoricalArray(df.Label; ordered=true, levels=labels)

# Plot
@df df groupedbar(:Label, :time, group=:lang,
    bar_position = :dodge,
    xlabel = "Simulations (N)",
    ylabel = "Time (s)",
    title = "Monte Carlo Simulation: Julia vs Python",
    legend = :topleft,
    size = (800, 400)
)

savefig("plots/runtime_comparison.png")
println("Chart saved to plots/runtime_comparison.png")
