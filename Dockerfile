FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y git build-essential libssl-dev libffi-dev python3-dev && \
    apt-get clean

WORKDIR /freqtrade

RUN git clone --branch develop https://github.com/freqtrade/freqtrade.git . && \
    pip install --upgrade pip && \
    pip install .

COPY config.json /freqtrade/config.json
COPY user_data/strategies /freqtrade/user_data/strategies

CMD ["freqtrade", "trade", "--config", "config.json", "--strategy", "SampleStrategy"]
