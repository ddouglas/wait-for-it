FROM golang:1.16.3 as builder
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 go build -o wait-for-it 

FROM alpine:latest AS release

COPY --from=builder /app/wait-for-it /go/bin/wait-for-it

LABEL maintainer="David Douglas <david@onetwentyseven.dev>"