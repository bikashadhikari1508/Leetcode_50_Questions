import pandas as pd # type: ignore 

def find_customer_referee(customer: pd.DataFrame) -> pd.DataFrame:
    return customer[
        (customer['referee_id'] != 2) |
        (customer['referee_id'].isna())
        ][['name']]