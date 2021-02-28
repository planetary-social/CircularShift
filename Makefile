BUILD_DIR ?= .build
SWIFT_FLAGS ?= -c release --enable-test-discovery --build-path $(BUILD_DIR)

build:
	swift build --build-tests $(SWIFT_FLAGS)

check: build
	swift test $(SWIFT_FLAGS)

clean:
	rm -rf $(BUILD_DIR)

.PHONY: build check clean
