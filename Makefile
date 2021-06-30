build: template.ego.go files/files.go
	mkdir -p dist
	go build -ldflags "-s -w" -o dist .

template.ego.go: template.ego
	ego -v

files/files.go: template.ego.go static/*
	@go get
	staticfiles --build-tags="!dev" --exclude="*.scss" -o files/files.go static/
