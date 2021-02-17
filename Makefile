BIN = ./bin
NAME = shard-shell
INPUT = $(NAME).cr

CR = crystal
CROPTS = build --release

CC = clang
CCOPTS = -O2 -march=native -shared -fPIC

all:
	@echo

mk_bin:
	$(RM) -r $(BIN)
	mkdir $(BIN)

build: mk_bin
	$(CR) $(CROPTS) src/*.cr -o bin/$(NAME)

run:
	./bin/$(NAME)

test:
	crystal spec spec/*.spec.cr

document:
	$(RM) -r ./docs
	crystal docs src/*.cr

clean:
	$(RM) -r ./bin
