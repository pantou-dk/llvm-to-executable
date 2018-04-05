FROM alpine:latest

RUN apk add --no-cache gcc llvm5
COPY compile.sh /usr/local/bin/compile.sh
RUN chmod 777 /usr/local/bin/compile.sh
ENTRYPOINT ["/usr/local/bin/compile.sh"]
