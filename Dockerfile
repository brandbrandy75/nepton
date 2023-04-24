FROM python:3.10-slim-buster


EXPOSE 8080

ENV NEPTUNE_API_ENV=production
ENV NEPTUNE_API_DEBUG=0
ENV NEPTUNE_API_TESTING=0
ENV NEPTUNE_API_DATABASE_URI=None

WORKDIR /opt/app

RUN echo "nameserver 185.51.200.2 >>/etc/resolv.conf"
RUN echo "nameserver 178.22.122.100 >>/etc/resolv.conf"
RUN echo "nameserver 185.55.225.25 >>/etc/resolv.conf"
RUN echo "nameserver 182.55.226.26 >>/etc/resolv.conf"

RUN apt-get update && apt-get install -y build-essential && libffi-dev libssl-dev python3-dev

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

CMD ./start
