# Compiler options
CC=g++
CFLAGS=-std=c++1z -Wconversion -Wall -Werror -Wextra -pedantic 
LDFLAGS=
EXECUTABLE_NAME=wiz

# Folders
SRC=src
BIN=bin
OBJ=$(BIN)/obj

# Files
SOURCE_FILES=\
			 main.cpp \

EXECUTABLE_FILES = $(EXECUTABLE_NAME:%=$(BIN)/%)
OBJECT_FILES     = $(SOURCE_FILES:%.cpp=$(OBJ)/%.o)
	# ^^^ A more succinct expression for $(OBJECT_FILES), using
	#     http://www.gnu.org/software/make/manual/make.html#Substitution-Refs

build: $(EXECUTABLE_FILES)

# http://www.gnu.org/software/make/manual/make.html#Phony-Targets
.PHONY: build clean

# ^^^ I don't recommend suppressing the echoing of the command using @
clean:
	rm -r -f $(BIN)


$(EXECUTABLE_FILES): $(OBJECT_FILES)
	mkdir -p $(BIN)
	$(CC) $(LDFLAGS) -lncurses -o $@ $^
	@# ^^^ http://www.gnu.org/software/make/manual/make.html#Automatic-Variables
	@echo "Build successful!"

# http://www.gnu.org/software/make/manual/make.html#Static-Pattern
$(OBJECT_FILES): $(OBJ)/%.o: $(SRC)/%.cpp
	@echo Compiling $<
	mkdir -p $(@D)
	@# ^^^ http://www.gnu.org/software/make/manual/make.html#index-_0024_0028_0040D_0029
	$(CC) $(CFLAGS) -c -o $@ $<
	@# ^^^ Use $(CFLAGS), not $(LDFLAGS), when compiling.

