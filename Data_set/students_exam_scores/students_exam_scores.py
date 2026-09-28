import pandas as pd
import numpy as np

data = pd.read_csv("D:/Pulls/Projects/Data_set/students_exam_scores/Expanded_data_with_more_features.csv")
df = pd.DataFrame(data)

print(df.head(1))
print(df.columns)