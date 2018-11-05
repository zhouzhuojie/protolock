FROM golang:1.11 as builder
ADD . /protolock
RUN cd /protolock && go build ./cmd/protolock

FROM alpine:3.6
VOLUME /app
WORKDIR /app
COPY --from=builder /protolock/protolock /protolock/protolock
ENTRYPOINT ["/protolock/protolock"]
CMD ["status"]
