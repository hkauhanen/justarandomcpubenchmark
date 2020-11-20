# Install and precompile dependencies

using Pkg

Pkg.add("Random")
Pkg.add(PackageSpec(url="https://github.com/hkauhanen/PopDyLan.jl", rev="0.0.4"))

using Random
using PopDyLan
