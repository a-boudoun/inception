
all: build

build:	mkdir -p /home/aboudoun/data/wp_files
	mkdir -p /home/aboudoun/data/wp_database
	docker-compose -f srcs/docker-compose.yml up --build


clean: docker-compose -f ./srcs/docker-compose.yml down -v --rmi all
	rm -rf /home/aboudoun/data/wp_files
	rm -rf /home/aboudoun/data/wp_database

re : clean all
