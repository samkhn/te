# te, trade engine

Experimental Linux C++ server that responds to FIX TCP packets as quickly as possible.

Goal: 1 microsecond response time.

## Requires

- make
- clang++ with C++17
- lld or ld/gold with DWARF5 support

To run tests and benchmarks, you'll need Google Benchmark and Google Test in your path.

## Build

```bash
$ make main
```

## Development

- Build everything into $(BUILD_DIR).
- Send file I/O to $(OUT_DIR).
- Header, src, tests and benchmarks should all be at same level in directory path.
- Keep CXX_FLAGS clean of debug or opt flags.
- Use Google C++ style guide.

### Testing

- Use the GTEST_FLAGS and GBM_FLAGS for library tests and benchmarks respectively.
- Build tests with debug flags and benchmarks with optimization flags.
- Add tests and benchmarks to `test` list and `bms` list.
- Check the server_include section for an example.

Run all tests or benchmarks
```bash
$ make tests
$ make bms
```
