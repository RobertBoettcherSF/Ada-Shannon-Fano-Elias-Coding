# Makefile
.PHONY: all test clean

GNAT = gnatmake
OBJ_DIR = obj
BIN_DIR = bin

all: $(BIN_DIR)/tests

$(BIN_DIR)/tests: tests.adb shannon_fano_elias.adb shannon_fano_elias.ads
	mkdir -p $(OBJ_DIR)$(BIN_DIR)
	# Build the executable dynamically linked into obj and bin utilizing GPR file.
	$(GNAT) -P sfe.gpr 

test: $(BIN_DIR)/tests
	@echo "Running verification tests..."
	@./$(BIN_DIR)/tests

clean:
	rm -rf $(OBJ_DIR)/*$(BIN_DIR)/*
