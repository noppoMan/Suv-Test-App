CLibUv=CLibUv-*
COpenSSL=COpenSSL-*

BUILDOPTS=-Xlinker -L/usr/lib -Xcc -IPackages/$(CLibUv) -Xcc -IPackages/$(COpenSSL)

SWIFTC=swiftc
SWIFT=swift
ifdef SWIFTPATH
  SWIFTC=$(SWIFTPATH)/bin/swiftc
  SWIFT=$(SWIFTPATH)/bin/swift
endif
OS := $(shell uname)
ifeq ($(OS),Darwin)
  SWIFTC=xcrun -sdk macosx swiftc
	BUILDOPTS=-Xlinker -L/usr/local/lib -Xcc -I/usr/local/include
	COpenSSL=COpenSSL-OSX-*
endif

all: debug

debug:
	$(SWIFT) build -v $(BUILDOPTS)
