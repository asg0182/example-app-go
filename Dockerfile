FROM golang:1.21-alpine3.18

RUN adduser --disabled-password --home /app -u 10001 app

WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download

COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /app/docker-app

USER app
EXPOSE 8080

# Run
CMD ["/app/docker-app"]