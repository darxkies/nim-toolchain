# Nim Toolchain

This project provides tools to generate truly dependence free Nim binaries. It requires Docker.

For now, only amd64 and armv6 (Raspberry Pi Zero+) binaries can be generated.

To generate the toolchains enter the following commands:

```
make nim-toolchain-amd64
make nim-toolchain-arm
```

To compile an Amd64 binary:

```
docker run -ti --rm -v $(pwd):/workspace darxkies/nim-toolchain:2019.02.3-amd64-0 nim c test.nim
```

And for Arm:

```
docker run -ti --rm -v $(pwd):/workspace darxkies/nim-toolchain:2019.02.3-arm-0 nim c --cpu:arm test.nim

```

To strip the binary:


```
docker run -ti --rm -v $(pwd):/workspace darxkies/nim-toolchain:2019.02.3-amd64-0 strip test
docker run -ti --rm -v $(pwd):/workspace darxkies/nim-toolchain:2019.02.3-arm-0 strip test
```

Upx is also included in the images:

```
docker run -ti --rm -v $(pwd):/workspace darxkies/nim-toolchain:2019.02.3-amd64-0 upx test
```

# Feedback

* E-Mail: darxkies@gmail.com
