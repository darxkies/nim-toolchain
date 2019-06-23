BUILDROOT_IMAGE_NAME = darxkies/buildroot:2019.02.3 
NIM_TOOLCHAIN_AMD64_IMAGE_NAME = darxkies/nim-toolchain:2019.02.3-amd64-0
NIM_TOOLCHAIN_ARM_IMAGE_NAME = darxkies/nim-toolchain:2019.02.3-arm-0

run:
	docker run -ti --rm $(BUILDROOT_IMAGE_NAME) bash

buildroot:
	docker build -t $(BUILDROOT_IMAGE_NAME) buildroot

menuconfig-nim-toolchain-amd64:
	docker run -ti --rm -v $$(pwd)/nim-toolchain-amd64/files/.config:/.config:rw $(BUILDROOT_IMAGE_NAME) sh -c "(cp /.config /buildroot/; make menuconfig; cp /buildroot/.config /)"

nim-toolchain-amd64: buildroot
	docker build -t $(NIM_TOOLCHAIN_AMD64_IMAGE_NAME) nim-toolchain-amd64

menuconfig-nim-toolchain-arm:
	docker run -ti --rm -v $$(pwd)/nim-toolchain-arm/files/.config:/.config:rw $(BUILDROOT_IMAGE_NAME) sh -c "(cp /.config /buildroot/; make menuconfig; cp /buildroot/.config /)"

nim-toolchain-arm: buildroot
	docker build -t $(NIM_TOOLCHAIN_ARM_IMAGE_NAME) nim-toolchain-arm

.PHONY: buildroot nim-toolchain-amd64 nim-toolchain-arm
