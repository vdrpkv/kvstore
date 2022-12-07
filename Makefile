generate:
	protoc --proto_path=api/grpc schema.proto --go_out=. --go-grpc_out=.

DEVENV_DOCKERCOMPOSE              = docker compose
DEVENV_FILES_PATH                 = ./etc/development
DEVENV_DOCKERCOMPOSE_FILENAME     = docker-compose.yaml
DEVENV_DOCKERCOMPOSE_ENV_FILENAME = .env

__DEVENV_DOCKERCOMPOSE_FILE = -f ${DEVENV_FILES_PATH}/${DEVENV_DOCKERCOMPOSE_FILENAME}
__DEVENV_DOCKERCOMPOSE_ENV  = --env-file ${DEVENV_FILES_PATH}/${DEVENV_DOCKERCOMPOSE_ENV_FILENAME}

devenv-up:
	${DEVENV_DOCKERCOMPOSE} ${__DEVENV_DOCKERCOMPOSE_FILE} ${__DEVENV_DOCKERCOMPOSE_ENV} up

devenv-up-d:
	${DEVENV_DOCKERCOMPOSE} ${__DEVENV_DOCKERCOMPOSE_FILE} ${__DEVENV_DOCKERCOMPOSE_ENV} up -d

devenv-down:
	${DEVENV_DOCKERCOMPOSE} ${__DEVENV_DOCKERCOMPOSE_FILE} down

run-server:
	go run ./cmd/grpc/server/server.go

run-client:
	go run ./cmd/grpc/client/client.go

run-memcached:
	go run ./cmd/memcached/memcached.go