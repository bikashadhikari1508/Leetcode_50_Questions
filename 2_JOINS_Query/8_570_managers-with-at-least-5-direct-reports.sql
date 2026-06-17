import pandas as pd

def find_managers(employee: pd.DataFrame) -> pd.DataFrame:
    df = employee.groupby('managerId').size().reset_index(name = 'manager')
    df = df.merge(employee[['id','name']], left_on = 'managerId', right_on = 'id', how = 'inner')
    result_df = df[df['manager'] >= 5]
    return result_df[['name']]