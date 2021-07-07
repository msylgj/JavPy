FROM arm64v8/node:buster as build

COPY . /javpy

RUN cd /javpy && npm install --only=prod --unsafe-perm && npm install -g pkg && pkg -t node14-linux .

FROM arm64v8/debian:buster-slim

WORKDIR /

COPY --from=build /javpy/javpy .

CMD ["./javpy"]
