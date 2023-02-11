
all: build

build:
	mkdir -p /home/aboudoun/data/wp_files
	mkdir -p /home/aboudoun/data/wp_database
	docker-compose -f ./srcs/docker-compose.yml up --build -d


clean:
	docker-compose -f ./srcs/docker-compose.yml down -v
	sudo rm -rf /home/aboudoun/data/wp_files
	sudo rm -rf /home/aboudoun/data/wp_database
	
fclean:
	docker rmi -f $$(docker images -aq)

.PHONY: all clean build fclean
