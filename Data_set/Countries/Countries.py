import numpy as np
import pandas as pd

data = pd.read_csv("D:/Pulls/Projects/Data_set/Countries/Countries.csv")
df = pd.DataFrame(data)


# 1. which country has the highest population

print("\nCountry with highest population: \n")
print(df[df["population"] == df["population"].max()]["country"])

# 2. what is the capital of the country with highest population

print("\nCapital of the country with highest population: \n")
print(df[df["population"] == df["population"].max()]["capital_city"])

# 3. which country has the least population

print("\nCountry with least population: \n")
print(df[df["population"] == df["population"].min()]["country"])

# 4. what is the capital of the country with least population

print("\nCapital of the country with least population: \n")
print(df[df["population"] == df["population"].min()]["capital_city"])

# 5. give me top 5 countries with highest democratic score

print("\nTop 5 countries with highest democratic score: \n")
print(df.sort_values("democracy_score", ascending=False)["country"].head())

# 6. how many total regions are there

print("\nTotal regions: \n")
print(df["region"].value_counts().count())

# 7. how many countries lie in Eastern Europe region

print("\nTotal countries lie in Eastern Europe\n")
print(df[df["region"] == "Eastern Europe"]["country"].count())

# 8. who is the political leader of the 2nd highest populated country

print("\nPolitical leader of the 2nd highest popylated country: \n")
print(df[df["population"] == df["population"].nlargest(2).iloc[1]]["political_leader"])

# 9. how many countries are there whoes political leaders are unknown

print("\nTotal countries, their political leaders are unknown: \n")
print(df["political_leader"].isnull().sum())

# 10. how many country have Republic in their full name

count = 0
def extract_republic(txt):
    global count
    if 'republic' in txt.lower():
        count += 1
    return txt

df["country_long"].apply(extract_republic)
print("\nTotal countries, which have republic in their full name: \n")
print(count)

# 11. which country in african region has highest population

print("\nCountry in Africa cotinent with Highest Population: \n")
africa_df = (df[df["continent"] == "Africa"])
print(africa_df[africa_df["population"] == africa_df["population"].max()]["country"])
print("\n\n")