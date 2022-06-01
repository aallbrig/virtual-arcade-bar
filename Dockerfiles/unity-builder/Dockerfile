ARG GAME_CI_UNITY_EDITOR_IMAGE

# build ruby
FROM $GAME_CI_UNITY_EDITOR_IMAGE

RUN apt-get update \
&&  apt-get upgrade -y --force-yes \
&&  apt-get install -y --force-yes \
    libssl-dev \
    libreadline-dev \
    zlib1g-dev \
    wget \
    curl \
    git \
    build-essential \
    blender \
&&  apt-get clean \
&&  rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
