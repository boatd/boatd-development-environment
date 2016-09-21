FROM debian:stretch
MAINTAINER Louis Taylor "louis@kragniz.eu"

RUN apt-get -y update && apt-get install -y \
    git make gcc pkg-config libjansson-dev \
    python-pip python3-pip python3 \
    supervisor

RUN git clone --recursive https://github.com/sails-simulator/sailsd.git
RUN make -C sailsd
RUN make -C sailsd install

RUN git clone https://github.com/sails-simulator/sails-ui-web
RUN cp sails-ui-web/sails-ui-web /usr/local/bin/
RUN pip3 install python-sailsd aiohttp

RUN git clone https://github.com/sails-simulator/sails-boatd-driver.git

RUN pip install boatd python-boatdclient python-sailsd

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY boatd-sailsd-config.yaml /etc/boatd-config.yaml

EXPOSE 2222 8080
CMD ["/usr/bin/supervisord"]
