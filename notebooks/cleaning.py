import pandas as pd

df = pd.read_csv('data/dubai_properties.csv')

df = df.drop_duplicates()
df = df.dropna()

df['price_per_sqft'] = df['price_aed'] / df['size_sqft']

summary = df.groupby('area').agg(
    listings=('listing_id','count'),
    avg_price=('price_aed','mean'),
    avg_ppsf=('price_per_sqft','mean')
).reset_index()

summary.to_csv('data/area_summary.csv', index=False)
print(summary.sort_values('avg_price', ascending=False).head())
