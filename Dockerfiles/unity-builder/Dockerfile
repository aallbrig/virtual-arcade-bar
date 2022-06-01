ARG GAME_CI_UNITY_EDITOR_IMAGE

# build ruby
FROM $GAME_CI_UNITY_EDITOR_IMAGE

RUN apt-get update \
&&  apt-get upgrade -y \
&&  apt-get install -y \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    wget \
    curl \
    git \
    build-essential \
&&  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y blender
RUN apt-get clean
