ARG base_image

FROM ${base_image} as base
RUN \
  apt-get update && \
  apt-get -y install sudo

FROM base as user_container
ARG user_name
RUN \
  useradd -rm -d /home/${user_name} -s /bin/bash -g root -G sudo -u 1001 ${user_name} && \
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
USER ${user_name}
WORKDIR /home/${user_name}

FROM user_container as deps
COPY deps deps
RUN \
  sudo chmod +x deps/install && \
  ./deps/install && \
  sudo apt-get clean && \
  sudo rm -rf /var/lib/apt/lists/*
