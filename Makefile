AS = as
LD = ld

OBJ = $(SRC:.s=.o)
SRC = 9cc.s errorUsage.s errorNotInt.s szToSlice.s isInt.s \
	write.s \
	tokenizer/Token.s tokenizer/Tokenizer.s tokenizer/Tokenizer/next.s \

TARGET = 9cc

.PHONY: all

all: $(TARGET)

.PHONY: clean

clean:
	rm -f $(OBJ)

.PHONY: test

test: $(TARGET)
	./test.sh

$(TARGET): $(OBJ)
	$(LD) -o $@ $(OBJ)

.s.o:
	$(AS) -o $@ $<

tokenizer/Tokenizer/next.o: tokenizer/Token.s tokenizer/Tokenizer/next.o
