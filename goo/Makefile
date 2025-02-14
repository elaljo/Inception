name = Inception

all:
	@printf "Launch configuration ${name}...\n"
	@mkdir -p /home/moelalj/data/wordpress
	@mkdir -p /home/moelalj/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up -d


build:
	@printf "Building configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
	@printf "Stopping configuration ${name}...\n"
	@docker-compose -f ./srcs/docker-compose.yml down

re:	down
	@printf "Rebuild configuration ${name}...\n"
	@mkdir -p /home/moelalj/data/wordpress
	@mkdir -p /home/moelalj/data/mariadb
	@docker-compose -f ./srcs/docker-compose.yml up -d --build

clean: down
	@printf "Cleaning configuration ${name}...\n"
	@docker system prune -a
	@sudo rm -rf /home/moelalj/data/*

fclean:
	@printf "Total clean of all configurations docker\n"
	@docker-compose -f ./srcs/docker-compose.yml down -v
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf /home/moelalj/data/*

.PHONY : all build down re clean fclean