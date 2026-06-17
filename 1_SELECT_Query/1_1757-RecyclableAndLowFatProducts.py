import pandas as pd  # type: ignore 

def find_products(products: pd.DataFrame) -> pd.DataFrame:
    return products[(products['recyclable'] == 'Y') & (products['low_fat'] == 'Y')][['product_id']].reset_index(drop=True,inplace=True)
