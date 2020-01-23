FROM jetbrains/teamcity-agent:latest

#install python3
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3
ENV PYTHON3 /usr/bin/python3

#install python3-pip
RUN apt-get install -y python3-pip
ENV PIP3 /usr/lib/python3/dist-packages/pip

#install teamcity-messages and psycopg2
RUN pip3 install teamcity-messages psycopg2-binary

#Install python2-pip
RUN apt-get install -y python-pip
ENV PIP /usr/lib/python2.7/dist-packages/pip

#install teamcity-messages, psycopg2-bunary
RUN pip install teamcity-messages psycopg2-binary

#move database settings
RUN mkdir /db_providers
COPY sqlite /db_providers/
COPY postgres /db_providers/
COPY mysql /db_providers/
COPY oracle /db_providers/
COPY cockroach /db_providers/

