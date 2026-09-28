import pandas as pd
import numpy as np

data = pd.read_csv("Data_set/airbnb_open_data/airbnb_open_data.csv")

"""
Checklist:-
1. Deleting redundant columns
2. Renaming the columns
3. Dropping duplicates
4. Cleaning individual columns
5. Remove the NaN values from the dataset
6. Check for some more Transformations
"""

# 1. Deleting redundant columns

columns_to_keep = ['NAME', 'host id', 'host_identity_verified', 'host name',
       'neighbourhood group', 'neighbourhood', 'lat', 'long', 'country',
       'country code', 'instant_bookable', 'cancellation_policy', 'room type',
       'Construction year', 'price', 'service fee', 'minimum nights',
       'number of reviews', 'last review']

df = pd.DataFrame(data= data[columns_to_keep])

# 2. Renaming the columns

new_renamed_columns = []
for i in df.columns:
    new_renamed_columns.append(i.upper())

df.columns = new_renamed_columns

# 3. Dropping duplicates

df.drop_duplicates(inplace= True)
print(df.duplicated().sum())

# print(df[df.duplicated()])
# print(df.shape)