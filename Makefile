INPUT = shard-shell.cr

mk_bin:
	$(RM) -r ./bin
	mkdir bin

all:
	crystal src/$(INPUT)

build: mk_bin
	clang -O2 -march=native -shared src/shard-shell/dir_walker/vector.c src/shard-shell/dir_walker/dir_walker.c -fPIC -o src/shard-shell/dir_walker.so
	crystal build src/*.cr -o bin/shard-shell

run:
	./bin/shard-shell

test:
	crystal spec spec/*.spec.cr

document:
	$(RM) -r ./docs
	crystal docs src/*.cr

clean:
	$(RM) -r ./bin
