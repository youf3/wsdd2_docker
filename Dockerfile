FROM alpine:latest AS build
RUN apk add --update git make gcc musl-dev linux-headers\
  && git clone https://github.com/Andy2244/wsdd2.git \
  && cd wsdd2 \
  && make

FROM alpine:latest
COPY --from=build /wsdd2 /wsdd2
CMD ["wsdd2/wsdd2", "-L", "-W"]
