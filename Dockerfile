# Build the manager binary
FROM golang:1.15 as builder
WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

# Copy the go source
COPY main.go main.go

# Build
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 GO111MODULE=on go build -a -o asg-node-roller main.go

# Release binary
FROM alpine:3.13 as release
WORKDIR /

COPY --from=Builder /app/asg-node-roller /

EXPOSE 8085
ENTRYPOINT ["/asg-node-roller"]
