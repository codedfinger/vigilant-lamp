DOCKER_USERNAME ?= codedfingers
APPLICATION_NAME ?= kippa-app
GIT_HASH ?= $(shell git log --format="%h" -n 1)

start:
	npm install
build:	
	sudo docker build --tag ${DOCKER_USERNAME}/${APPLICATION_NAME} .
run:
	sudo docker run -p 5001:5001 -d ${DOCKER_USERNAME}/${APPLICATION_NAME}
push:
	sudo docker push ${DOCKER_USERNAME}/${APPLICATION_NAME}
release:
	sudo docker pull ${DOCKER_USERNAME}/${APPLICATION_NAME}:${GIT_HASH}
	sudo docker tag  ${DOCKER_USERNAME}/${APPLICATION_NAME}:${GIT_HASH} ${DOCKER_USERNAME}/${APPLICATION_NAME}:latest
	sudo docker push ${DOCKER_USERNAME}/${APPLICATION_NAME}:latest
deploy:
	kubectl apply -f kube_

default:
	npm install
	sudo docker build --tag ${DOCKER_USERNAME}/${APPLICATION_NAME} .
	sudo docker push ${DOCKER_USERNAME}/${APPLICATION_NAME}
	sudo docker run -p 5001:5001 -d ${DOCKER_USERNAME}/${APPLICATION_NAME}
	kubectl apply -f kube_