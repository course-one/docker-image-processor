# parent image
FROM golang:1.15.6-alpine3.12

# workspace directory
WORKDIR /app

# copy `go.mod` and `go.sum`
ADD go.mod go.sum ./

# install dependencies
RUN go mod download

# copy source code
COPY . .

# build executable
RUN go build -o ./bin/avatar .

# create volume
VOLUME [ "/app/shared" ]

# set entrypoint
ENTRYPOINT [ "./bin/avatar" ]

# set default arguments
CMD [ "./test.jpg", "./shared/test_out.jpg" ]
