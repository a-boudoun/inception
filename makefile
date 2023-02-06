
all: build

build:
	mkdir -p /home/abderrahim/data/wp_files
	mkdir -p /home/abderrahim/data/wp_database
	docker-compose -f ./srcs/docker-compose.yml up --build -d


clean:
	docker-compose -f ./srcs/docker-compose.yml down -v --rmi all
	# docker rmi -f $$(docker images -aq)
	sudo rm -rf /home/abderrahim/data/wp_files
	sudo rm -rf /home/abderrahim/data/wp_database

re : clean all
