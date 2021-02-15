INPUT = shard-shell.cr

all:
	crystal src/$(INPUT)

build:
	shards build

run:
	./bin/shards

test:
	crystal spec spec/*.spec.cr

document:
	$(RM) -r ./docs
	crystal docs src/*.cr

clean:
	$(RM) -r ./bin
