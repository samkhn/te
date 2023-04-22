#include <benchmark/benchmark.h>

#include "server.hpp"

static void BM_ServerRun(benchmark::State &state) {
  Trade::Engine::Net::Server s;
  for (auto _ : state) {
    int r = s.Run();
    benchmark::DoNotOptimize(s);
  }
}

BENCHMARK(BM_ServerRun);

BENCHMARK_MAIN();
