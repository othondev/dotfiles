ARG base_image

FROM ${base_image} as base
RUN \
  apt-get update && \
  apt-get -y install sudo && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

COPY . .

FROM base
RUN bash deps/install || true # Ignore if it fails.
