CC = gcc
FLAGS = -g -Wall -Wextra -O2 

OBJECT_FILES = createPopulation.o main.o genes.o layer.o mutate.o draw.o

COMMANDS = compile link clean

all: $(COMMANDS)

compile: src/createPopulation.c src/mutate.c src/genes.c
	$(CC) $(FLAGS) -c src/createPopulation.c
	$(CC) $(FLAGS) -c src/main.c
	$(CC) $(FLAGS) -c src/mutate.c
	$(CC) $(FLAGS) -c src/genes.c
	$(CC) $(FLAGS) -c src/layer.c
	$(CC) $(FLAGS) -c src/draw.c
link: createPopulation.o main.o genes.o mutate.o layer.o
	gcc $(FLAGS)  $(OBJECT_FILES) -o build/NEAT.out -lpthread -lSDL2main -lSDL2

clean:
	rm *.o

run:
	clear
	./build/NEAT.out

