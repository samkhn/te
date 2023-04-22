# Trade Engine
# Tests and benchmarks depend on Google Test and Google Benchmark

export SHELL := /bin/bash -o pipefail

CXX_COMPILER = clang++
CXX_FLAGS = -std=c++17 -Wall -Werror -pedantic -fuse-ld=lld
GTEST_FLAGS = $(CXX_FLAGS) -lgtest -lpthread -g
GBM_FLAGS = -std=c++17 -lbenchmark -lpthread -O3

BUILD_DIR := $(CURDIR)/build
OUT_DIR := $(CURDIR)/out

# Tests and libraries

server_lib := net/server.cpp
server_test := $(BUILD_DIR)/server_test
server_bm := $(BUILD_DIR)/server_bm

server_test: $(server_test)
	$<

$(server_test): net/server_test.cpp $(server_lib)
	@mkdir -p $(BUILD_DIR)
	$(CXX_COMPILER) $(GTEST_FLAGS) $^ -o $@

server_bm: $(server_bm)
	$<

$(server_bm): net/server_bm.cpp $(server_lib)
	@mkdir -p $(BUILD_DIR)
	$(CXX_COMPILER) $(GBM_FLAGS) $^ -o $@

tests: server_test
bms: server_bm

# Executables

main_target := $(BUILD_DIR)/main

main: $(main_target)
	$<

$(main_target): main.cpp $(server_lib)
	@mkdir -p $(BUILD_DIR)
	$(CXX_COMPILER) $(CXX_FLAGS) $^ -O3 -o $@

# Project level targets

all: tests bms main

compile_commands: clean
	@bear -- make all

clean:
	@test -d $(BUILD_DIR) && rm -rf $(BUILD_DIR) || true
	@test -d $(OUT_DIR) && rm -rf $(OUT_DIR) || true
