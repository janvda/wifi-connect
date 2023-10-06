export COMPOSE_DOCKER_CLI_BUILD=0

current_docker_context:=$(shell docker context ls | grep -e "*" | cut -d ' ' -f1 )

# on pi3three we support both a prod an dev environment
# on nuc1 we only support a dev environment.
ifeq (${current_docker_context},pi3three)
  ifeq (${env},dev)
     suffix=dev
     project_name=wifi-connect-dev
  else 
     suffix=prod
     project_name=wifi-connect
  endif
else ifeq (${current_docker_context},nuc1-lan)
  suffix=dev
  project_name=wifi-connect-dev
else
  $(error "Current docker context[=$(current_docker_context)] is not pi3three or nuc1-lan")
endif

compose_override=docker-compose.$(suffix).yml

default: current_context

current_context:
	@echo  "========================================================================================="
	@echo  "current context:"
	@echo  "    current docker context = $(current_docker_context)"
	@echo  "    project_name = $(project_name)"
	@echo  "    docker_compose_override = $(compose_override)"
	@echo  "usage:"
	@echo  "     # docker-compose commands:"
	@echo  "     make [all|up|build|down|stop|start|restart|ps|logs|top|images]"
	@echo  ""
	@echo  "     # docker-compose commands for development environment on pi3three:"
	@echo  "     env=dev make [all|up|build|down|stop|start|restart|ps|logs|top|images]"
	@echo  ""
	@echo  "     # docker system commands:"
	@echo  "     make stats     # hows CPU, memory usage,... of the containers."
	@echo  "     make size      # shows container disk size, the virtual size includes the size of the container image."	
	@echo  "     make df        # shows all system resources used by docker"
	@echo  "     make df_v      # same as df but more verbose output"
	@echo  "     make prune     # removes all unused containers, networks, images"
	@echo  "     make prune_all # same as prune but also removes unused volumes"	
	@echo  "========================================================================================="
	@test -s $(compose_override) || { echo "ERROR: File $(compose_override) doesn't exist.  Exiting..." ; exit 1; }


all: 
	docker-compose -f docker-compose.yml  -f $(compose_override) -p $(project_name) up -d --build

up:
	docker-compose -f docker-compose.yml  -f $(compose_override) -p $(project_name) up -d

down stop start restart ps logs top images build:
	docker-compose -f docker-compose.yml  -f $(compose_override) -p $(project_name) $@

# shows CPU and memory usage of the containers.
stats:
	docker stats

df :
	docker system df

df_v :
	docker system df -v

# shows container disk size, the virtual size includes the size of the container image.
size:
	docker ps --size

prune :
	docker system prune -a

prune_all :
	docker system prune -a --volumes

.PHONY: default up  build down stop start restart ps logs top images df df_v prune prune_all stats size
