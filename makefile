CXX      = g++
CXXFLAGS = -std=c++17 -O3 -Iinclude
LDFLAGS  = -lcomplex_bessel

DRUDE_INC = -Iinclude/Dielectric/DrudeAl

SRC_DIR   = src
BUILD_DIR = build
BIN_DIR   = bin

TARGET = $(BIN_DIR)/AMTsolver

OBJS = \
	$(BUILD_DIR)/IN51.o \
	$(BUILD_DIR)/main.o

all: directories $(TARGET)

directories:
	mkdir -p $(BUILD_DIR) $(BIN_DIR)

$(BUILD_DIR)/IN51.o: $(SRC_DIR)/IN51.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(BUILD_DIR)/main.o: $(SRC_DIR)/main.cpp
	$(CXX) $(CXXFLAGS) $(DRUDE_INC) -c $< -o $@

$(TARGET): $(OBJS)
	$(CXX) $(OBJS) -o $@ $(LDFLAGS)

clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)

rebuild: clean all

.PHONY: all clean rebuild directories


