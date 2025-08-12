# Compilador y opciones
AS      = aarch64-linux-gnu-as
LD      = aarch64-linux-gnu-ld
CC      = aarch64-linux-gnu-gcc
QEMU    = qemu-aarch64
CFLAGS  = -nostdlib

# Archivos
SRC     = src/main.S
OBJ     = main.o
BIN     = prog

# Compilar y enlazar
build: $(BIN)

$(BIN): $(OBJ)
	$(LD) -o $(BIN) $(OBJ)

$(OBJ): $(SRC)
	$(AS) -o $(OBJ) $(SRC)

# Ejecutar con QEMU
run: $(BIN)
	$(QEMU) -L /usr/aarch64-linux-gnu ./$(BIN)

# Limpiar
clean:
	rm -f $(OBJ) $(BIN)
