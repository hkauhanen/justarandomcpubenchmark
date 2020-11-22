# Dependencies
using Random
using PopDyLan


# Set RNG seed for reproducibility
Random.seed!(2020)


# Number of repetitions and simulations (per repetition)
reps = 5
sims = 100


# Function to carry out one simulation
function onesim()
  # Initialize a pool of speakers
  com = PopDyLan.PoolCommunity()

  # Add speakers
  for i in 1:1000
    inject!(MomentumSelector(0.01, 0.05, 1.0, 5, 0.01), com)
  end

  # Iterate
  for t in 1:10_000_000
    rendezvous!(com)
  end
end


# Number of threads and test ID
nt = Threads.nthreads()
id = ARGS[1]


# Loop over repetitions
for rep in 0:reps
  # Loop over simulations using multithreading, saving elapsed time
  tim = @elapsed Threads.@threads for sim in 1:sims
    onesim()
  end

  # Printout
  println("pool_10x,$id,$nt,$rep,$tim")
end
