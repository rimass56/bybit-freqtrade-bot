FROM freqtradeorg/freqtrade:stable

COPY config.json /freqtrade/user_data/config.json
COPY user_data/strategies /freqtrade/user_data/strategies

CMD ["freqtrade", "trade", "--config", "user_data/config.json", "--strategy", "SampleStrategy"]
