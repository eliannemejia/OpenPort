import requests
import json
import pandas as pd
from sklearn.preprocessing import OneHotEncoder
from collections import Counter
import numpy as np
import plotly.express as px

url = "https://ec.europa.eu/eurostat/api/dissemination/statistics/1.0/data/tps00098?format=JSON&time=2011&time=2012&time=2013&time=2014&time=2015&time=2016&time=2017&time=2018&time=2019&time=2020&time=2021&time=2022&geo=BE&geo=BG&geo=CZ&geo=DK&geo=DE&geo=EE&geo=IE&geo=EL&geo=ES&geo=FR&geo=HR&geo=IT&geo=CY&geo=LV&geo=LT&geo=LU&geo=HU&geo=MT&geo=NL&geo=AT&geo=PL&geo=PT&geo=RO&geo=SI&geo=SK&geo=FI&geo=SE&geo=IS&geo=NO&geo=CH&geo=BA&geo=RS&geo=TR&unit=PC_GDP&spdeps=TOTAL&lang=en"
response = requests.get(url)
data = response.json()
dimensions = data['dimension']
values = data['value']

rows = []
dim_names = list(dimensions.keys())

for index, value in values.items():
    row = {}
    idx = int(index)
    temp_idx = idx
    
    for dim_name in reversed(dim_names):
        dim_size = len(dimensions[dim_name]['category']['index'])
        dim_idx = temp_idx % dim_size
        temp_idx = temp_idx // dim_size
        
        dim_keys = list(dimensions[dim_name]['category']['index'].keys())
        category_key = dim_keys[dim_idx]
        
        if 'label' in dimensions[dim_name]['category']:
            row[dim_name] = dimensions[dim_name]['category']['label'].get(category_key, category_key)
        else:
            row[dim_name] = category_key
    
    row['value'] = value  
    rows.append(row)      
df = pd.DataFrame(rows)
df_clean = df.drop(["spdeps", "freq", "unit"], axis=1)
df_clean = df_clean[df_clean['geo'] != 'Türkiye']
df_clean = df_clean[df_clean['geo'] != 'Bosnia and Herzegovina']
df_clean = df_clean.drop_duplicates(subset=["geo", "time"])
df_clean = df_clean.sort_values(by=["time", "geo"])
df_clean["time"] = df_clean["time"].astype(int)
def X_df(country):
    df_X = pd.DataFrame()
    df_X["Countries"] = [country] * 7
    df_X["lag_1"] = df_clean[(df_clean["geo"] == country) & (df_clean["time"] >= 2015) & (df_clean["time"] <= 2021)]["value"].reset_index(drop = True)
    df_X["lag_2"] = df_clean[(df_clean["geo"] == country) & (df_clean["time"] >= 2014) & (df_clean["time"] <= 2020)]["value"].reset_index(drop = True)
    df_X["lag_3"] = df_clean[(df_clean["geo"] == country) & (df_clean["time"] >= 2013) & (df_clean["time"] <= 2019)]["value"].reset_index(drop = True)
    df_X["lag_4"] = df_clean[(df_clean["geo"] == country) & (df_clean["time"] >= 2012) & (df_clean["time"] <= 2018)]["value"].reset_index(drop = True)
    df_X["lag_5"] = df_clean[(df_clean["geo"] == country) & (df_clean["time"] >= 2011) & (df_clean["time"] <= 2017)]["value"].reset_index(drop = True)
    df_X["COVID"] =  [0, 0, 0, 0, 1, 1, 0]
    df_X["y"] = df_clean[(df_clean["geo"] == country) & (df_clean["time"] >= 2016) & (df_clean["time"] <= 2022)]["value"].reset_index(drop = True)
    return df_X
country_list = df_clean["geo"].unique().tolist() 
all_dfs = []
for i in (country_list):
    df_country = X_df(i)
    all_dfs.append(df_country)
final_df = pd.concat(all_dfs, ignore_index=True)
X_removed = final_df.drop(['y'], axis=1)
y = final_df['y'].to_numpy()
categorical_cols = ["Countries"]
encoder = OneHotEncoder(sparse_output=False)
one_hot_encoded = encoder.fit_transform(X_removed[categorical_cols])
one_hot_df = pd.DataFrame(one_hot_encoded, columns=encoder.get_feature_names_out(categorical_cols))
lag_features = final_df[['lag_1', 'lag_2', 'lag_3', 'lag_4', 'lag_5', "COVID"]]
X_combined = pd.concat([one_hot_df,lag_features], axis=1)
X = X_combined.to_numpy()
XtXinv = np.linalg.inv(np.matmul(X.T, X))
m = np.matmul(XtXinv, np.matmul(X.T, y))
print(m)