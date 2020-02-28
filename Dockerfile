FROM jetbrains/teamcity-agent:latest
RUN apt-get update && apt-get upgrade -y 
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y make build-essential libssl1.0-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev libffi-dev liblzma-dev python-openssl git libaio1 gcc libpq-dev python-dev

RUN git clone git://github.com/pyenv/pyenv.git .pyenv

ENV HOME  /
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN pyenv install 2.7.11 && pyenv local 2.7.11 && pip install --upgrade pip && pip install pymysql psycopg2-binary cx_Oracle teamcity-messages twine && pip install --upgrade keyrings.alt
RUN pyenv install 3.6.10 && pyenv local 3.6.10 && pip install --upgrade pip && pip install pymysql psycopg2-binary cx_Oracle teamcity-messages twine && pip install --upgrade keyrings.alt
RUN pyenv install 3.7.6 && pyenv local 3.7.6 && pip install --upgrade pip && pip install pymysql psycopg2-binary cx_Oracle teamcity-messages twine && pip install --upgrade keyrings.alt
RUN pyenv install 3.8.1 && pyenv local 3.8.1 && pip install --upgrade pip && pip install pymysql psycopg2-binary cx_Oracle teamcity-messages twine && pip install --upgrade keyrings.alt
RUN pyenv install pypy2.7-7.3.0 && pyenv local pypy2.7-7.3.0 && pip install --upgrade pip && pip install pymysql psycopg2cffi cx_Oracle teamcity-messages twine && pip install --upgrade keyrings.alt
RUN pyenv install pypy3.6-7.3.0 && pyenv local pypy3.6-7.3.0 && python -m pip install --upgrade pip && python -m pip install pymysql psycopg2cffi cx_Oracle teamcity-messages twine && python -m pip install --upgrade keyrings.alt

RUN mkdir /db_providers && mkdir /oracle_stuff
COPY settings /db_providers/
RUN cd /db_providers && tar -xvf settings

COPY install_client.sh /oracle_stuff/
RUN /bin/bash -c 'chmod +x /oracle_stuff/install_client.sh && ./oracle_stuff/install_client.sh'

