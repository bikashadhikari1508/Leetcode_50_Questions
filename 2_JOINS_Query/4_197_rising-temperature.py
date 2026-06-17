import pandas as pd

def rising_temperature(weather: pd.DataFrame) -> pd.DataFrame:

    weather = weather.sort_values('recordDate')

    weather['prev_temp'] = weather['temperature'].shift(1)
    weather['prev_date'] = weather['recordDate'].shift(1)

    result = weather[
        ((weather['recordDate'] - weather['prev_date']).dt.days == 1) &
        (weather['temperature'] > weather['prev_temp'])
    ][['id']]

    return result
    