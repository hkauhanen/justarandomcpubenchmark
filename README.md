# justarandomcpubenchmark

A CPU benchmark involving a model of language dynamics (discussed [here](FIXME)). Tested on Julia 1.5.3 (at least 1.5 required). To run a benchmark:

```bash
julia prepare.jl
bash runtest.sh <MAXTHREADS> <TESTID>
cat results/* >> results.csv
```

Output is (initially) (over)written to `results`. A benchmark will be run using each of 1, ... , `<MAXTHREADS>` threads. `<TESTID>` is a unique test identifier (a string) identifying the system, so that the results of benchmarks run on several different systems can be easily concatenated.

`prepare.jl` installs required dependencies from the internet, so an internet connection is required.
