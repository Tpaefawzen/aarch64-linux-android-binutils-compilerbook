AS = as
LD = ld

OBJ = $(SRC:.s=.o)
SRC = 9cc.s errorUsage.s errorNotInt.s szToSlice.s isInt.s \
	write.s
TARGET = 9cc

.PHONY: all

all: $(TARGET)

.PHONY: clean

clean:
	rm -f $(OBJ)

$(TARGET): $(OBJ)
	$(LD) -o $@ $(OBJ)

.s.o:
	$(AS) -o $@ $<

