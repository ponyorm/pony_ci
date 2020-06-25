FROM jetbrains/teamcity-agent:latest
USER root
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y make build-essential libssl1.0-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git libaio1 gcc libpq-dev python-dev

RUN git clone git://github.com/pyenv/pyenv.git .pyenv
ENV HOME  /
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN mkdir /db_providers /scripts /oracle_soft
COPY install_pyenv.sh install_client.sh /scripts/
COPY sqlite postgres mysql oracle cockroach /db_providers/

RUN /bin/bash -c 'cd /scripts && chmod +x install_pyenv.sh && ./install_pyenv.sh'
RUN /bin/bash -c 'cd /scripts && chmod +x install_client.sh && ./install_client.sh'
