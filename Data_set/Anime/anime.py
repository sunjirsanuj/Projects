import numpy as np
import pandas as pd
from dateutil.relativedelta import relativedelta
from datetime import datetime

data = pd.read_csv('D:/Pulls/Projects/Data_set/Anime/anime.csv')
df = pd.DataFrame(data)

# 1. make a new column for episode count

def extract_epicods(txt):
    data = ""
    check = False
    for i in txt:
        if i == ')':
            break
        if check:
            data += i
        if i == '(':
            check = True
    return data

df["Episodes"] = df["Title"].apply(extract_epicods)
df["Episodes"] = df["Episodes"].str.replace(" eps", "")
df["Episodes"] = df["Episodes"].astype(int)

# 2. make a new column for time stamp

def extract_timeStamp(txt):
    data = ""
    check = False
    for i in range(len(txt)):
        if txt[i] == ')':
            for j in range(i+1, i+20):
                data += txt[j]
            return data
        
df["Time Stamp"] = df["Title"].apply(extract_timeStamp)

def calculate_total_months(period):
    try:
        start_str, end_str = period.split(' - ')
        start_date = datetime.strptime(start_str, '%b %Y')
        end_date = datetime.strptime(end_str, '%b %Y')
        r = relativedelta(end_date, start_date)
        return r.years * 12 + r.months + 1
    except:
        return None

df['Months'] = df['Time Stamp'].apply(calculate_total_months)

# 3. which anime has the highest score

print("\n Highest Score Anime: \n")
print(df[df["Score"] == df["Score"].max()]["Title"])

# 4. give me top 5 highest scoring anime

print("\n Top 5 Highest Score Anime: \n")
print(df["Title"].head())

# 5. which anime has the highest episode count

print("\n Highest Episode Count Anime: \n")
print(df[df["Episodes"] == df["Episodes"].max()]["Title"])

# 6. animes with top 5 episode count

print("\n Top 5 Highest Episode Count Anime: \n")
print(df.sort_values("Episodes", ascending=False)["Title"].head())

# 7. which is the longest running anime

print("\n Longest Running Anime: \n")
print(df[df["Months"] == df["Months"].max()]["Title"])
print("\n\n")