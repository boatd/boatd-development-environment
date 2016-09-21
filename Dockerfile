FROM debian:jessie
MAINTAINER Louis Taylor "louis@kragniz.eu"

RUN apt-get -y update && apt-get install -y git make gcc pkg-config libjansson-dev python-pip python3-pip python3 supervisor

RUN git clone --recursive https://github.com/sails-simulator/sailsd.git
RUN ls sailsd
RUN make -C sailsd
RUN make -C sailsd install

RUN git clone https://github.com/sails-simulator/sails-ui-web
RUN ls sails-ui-web
RUN cp sails-ui-web/sails-ui-web /usr/local/bin/
RUN pip3 install python-sailsd aiohttp

RUN pip install boatd python-boatdclient python-sailsd

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 2222 8080
CMD ["/usr/bin/supervisord"]
