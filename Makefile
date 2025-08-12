TARGET=prog
SRC=src/main.S
all: test

build:
aarch64-linux-gnu-as -o $(TARGET).o $(SRC)
aarch64-linux-gnu-ld -o $(TARGET) $(TARGET).o

run: build
qemu-aarch64 -L /usr/aarch64-linux-gnu ./$(TARGET)

test: build
bash tests/run_tests.sh
