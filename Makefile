

build: Dockerfile
	docker build -t nvim:dev .

run: build
	docker run -it --rm  nvim:dev
