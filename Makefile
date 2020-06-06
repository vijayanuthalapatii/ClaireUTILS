CC = gcc
CFLAGS = -Wall

SRC = src/cat.c \
      src/true.c \
      src/false.c \
      src/yes.c \
      src/wc.c \
      src/unlink.c \
      src/rm.c \
      src/ls.c

ALL_BIN = cat \
	  true \
	  false \
	  yes \
	  wc \
	  unlink \
	  rm \
	  ls

OUT_DIR = bin
INSTALL_DIR = /usr/bin

all: $(SRC) check_bin_dir $(ALL_BIN)

check_bin_dir:
	@if test -d bin; then printf ""; else mkdir bin; fi

cat: src/cat.c check_bin_dir
	$(CC) src/cat.c $(CFLAGS) -o $(OUT_DIR)/cat

true: src/true.c check_bin_dir
	$(CC) src/true.c $(CFLAGS) -o $(OUT_DIR)/true

false: src/false.c check_bin_dir
	$(CC) src/false.c $(CFLAGS) -o $(OUT_DIR)/false

yes: src/yes.c check_bin_dir
	$(CC) src/yes.c $(CFLAGS) -o $(OUT_DIR)/yes

wc: src/wc.c check_bin_dir
	$(CC) src/wc.c $(CFLAGS) -o $(OUT_DIR)/wc

unlink: src/unlink.c check_bin_dir
	$(CC) src/unlink.c $(CFLAGS) -o $(OUT_DIR)/unlink

rm: src/rm.c check_bin_dir
	$(CC) src/rm.c $(CFLAGS) -o $(OUT_DIR)/rm

ls: src/ls.c check_bin_dir
	$(CC) src/ls.c $(CFLAGS) -o $(OUT_DIR)/ls
	@echo "Output dir: $(OUT_DIR)/"

.PHONY: clean help

clean:
	rm -rf $(OUT_DIR)/

install:
	cp $(OUT_DIR)/* $(INSTALL_DIR)
help:
	@echo "Targets:"
	@echo "\tcat"
	@echo "\ttrue"
	@echo "\tfalse"
	@echo "\twc"
	@echo "\tunlink"
	@echo "\trm"
	@echo "\tls"
