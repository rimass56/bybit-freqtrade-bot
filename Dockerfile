FROM freqtradeorg/freqtrade:stable

COPY config.json /freqtrade/user_data/config.json
COPY strategies /freqtrade/user_data/strategies

COPY user_data/strategies /freqtrade/user_data/strategies
