# Nim Toolchain

This project provides tools to generate truly dependence free Nim binaries. It requires Docker.

For now, only Amd64 and Armv6 (Raspberry Pi Zero+) binaries can be generated. Support for OpenSSL and PCRE is included.

The toolchains are generated using Buildroot LTS 2019.02.3.

To generate the toolchains enter the following commands:

```
make nim-toolchain-amd64
make nim-toolchain-arm
```

New libraries can be added by executing the following commands and then the previous ones:

```
make menuconfig-nim-toolchain-amd64
make menuconfig-nim-toolchain-arm
```

To generate Amd64/Arm binaries:

```
docker run -ti --rm -v $(pwd):/workspace darxkies/nim-toolchain:2019.02.3-amd64-0 nim c test.nim
docker run -ti --rm -v $(pwd):/workspace darxkies/nim-toolchain:2019.02.3-arm-0 nim c test.nim
```

Binaries can be stripped like so::


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
