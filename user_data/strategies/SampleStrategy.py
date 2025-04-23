from freqtrade.strategy.interface import IStrategy
from pandas import DataFrame

class SampleStrategy(IStrategy):
    timeframe = '5m'

    def populate_indicators(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        dataframe['ema'] = dataframe['close'].ewm(span=9).mean()
        return dataframe

    def populate_entry_trend(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        dataframe.loc[
            (dataframe['close'] > dataframe['ema']),
            'enter_long'] = 1
        return dataframe

    def populate_exit_trend(self, dataframe: DataFrame, metadata: dict) -> DataFrame:
        dataframe.loc[
            (dataframe['close'] < dataframe['ema']),
            'exit_long'] = 1
        return dataframe
