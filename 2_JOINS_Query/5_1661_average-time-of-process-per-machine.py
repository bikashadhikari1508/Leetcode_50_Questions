import pandas as pd

def get_average_time(activity: pd.DataFrame) -> pd.DataFrame:

    df = activity.pivot(
        index=['machine_id', 'process_id'],
        columns='activity_type',
        values='timestamp'
    ).reset_index()

    df['processing_time'] = df['end'] - df['start']

    return (
        df.groupby('machine_id')['processing_time']
        .mean()
        .round(3)
        .reset_index()
    )