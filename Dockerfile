FROM alpine:3 as build

# Install git to clone wait-for-it
RUN apk add --no-cache git
RUN git clone https://github.com/vishnubob/wait-for-it

# Alpine-based bash
FROM bash:5-alpine3.14

COPY --from=build /wait-for-it .

RUN chmod +x wait-for-it.sh

ENTRYPOINT [ "/wait-for-it.sh" ]
