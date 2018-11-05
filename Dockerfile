FROM golang:1.11
ADD . /protolock
RUN cd /protolock && go build ./cmd/protolock

VOLUME /app
WORKDIR /app
ENTRYPOINT ["/protolock/protolock"]
CMD ["status"]
