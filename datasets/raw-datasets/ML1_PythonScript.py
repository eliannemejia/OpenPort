import requests
import json
import pandas as pd
from collections import Counter
import numpy as np
import plotly.express as px
import plotly as p
from sklearn.preprocessing import OneHotEncoder
import math
from sklearn.metrics import confusion_matrix, ConfusionMatrixDisplay
import matplotlib.pyplot as plt
import seaborn as sns

def api_func(year):
    api_URL= f"https://ec.europa.eu/eurostat/api/dissemination/statistics/1.0/data/migr_asydcfsta?format=JSON&time={year}&unit=PER&citizen=LI&citizen=UK_OCT&citizen=BA&citizen=ME&citizen=MD&citizen=MK&citizen=GE&citizen=AL&citizen=RS&citizen=TR&citizen=UA&citizen=XK&citizen=AD&citizen=BY&citizen=VA&citizen=MC&citizen=RU&citizen=SM&citizen=AO&citizen=CM&citizen=CF&citizen=TD&citizen=CG&citizen=CD&citizen=GQ&citizen=GA&citizen=ST&citizen=BI&citizen=KM&citizen=DJ&citizen=ER&citizen=ET&citizen=KE&citizen=MG&citizen=MW&citizen=MU&citizen=MZ&citizen=RW&citizen=SC&citizen=SO&citizen=UG&citizen=TZ&citizen=ZM&citizen=ZW&citizen=DZ&citizen=EG&citizen=LY&citizen=MA&citizen=SS&citizen=SD&citizen=TN&citizen=EH&citizen=BW&citizen=LS&citizen=NA&citizen=ZA&citizen=SZ&citizen=BJ&citizen=BF&citizen=CV&citizen=CI&citizen=GM&citizen=GH&citizen=GN&citizen=GW&citizen=LR&citizen=ML&citizen=MR&citizen=NE&citizen=NG&citizen=SN&citizen=SL&citizen=TG&citizen=AG&citizen=BS&citizen=BB&citizen=CU&citizen=DM&citizen=DO&citizen=GD&citizen=HT&citizen=JM&citizen=KN&citizen=LC&citizen=VC&citizen=TT&citizen=BZ&citizen=CR&citizen=SV&citizen=GT&citizen=HN&citizen=MX&citizen=NI&citizen=PA&citizen=AR&citizen=BO&citizen=BR&citizen=CL&citizen=CO&citizen=EC&citizen=GY&citizen=PY&citizen=PE&citizen=SR&citizen=UY&citizen=VE&citizen=KZ&citizen=KG&citizen=TJ&citizen=TM&citizen=UZ&citizen=CN&citizen=JP&citizen=MN&citizen=KP&citizen=KR&citizen=TW&citizen=AF&citizen=BD&citizen=BT&citizen=IN&citizen=IR&citizen=MV&citizen=NP&citizen=PK&citizen=LK&citizen=BN&citizen=KH&citizen=ID&citizen=LA&citizen=MY&citizen=MM&citizen=PH&citizen=SG&citizen=TH&citizen=TL&citizen=VN&citizen=AM&citizen=AZ&citizen=BH&citizen=IQ&citizen=IL&citizen=JO&citizen=KW&citizen=LB&citizen=PS&citizen=OM&citizen=QA&citizen=SA&citizen=SY&citizen=AE&citizen=YE&citizen=AU&citizen=NZ&citizen=FJ&citizen=PG&citizen=SB&citizen=VU&citizen=KI&citizen=MH&citizen=FM&citizen=NR&citizen=PW&citizen=CK&citizen=WS&citizen=TO&citizen=TV&citizen=RNC&citizen=STLS&citizen=TOTAL&citizen=UNK&sex=T&sex=M&sex=F&sex=UNK&age=TOTAL&age=Y_LT14&age=Y14-17&age=Y_LT18&age=Y18-34&age=Y35-64&age=Y_GE65&age=UNK&decision=TOTAL&decision=TOTAL_POS&decision=REJECTED&lang=en"
    response = requests.get(api_URL)
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
    asylum_drop = df.drop(["unit","freq"], axis =1 )
    asylum_drop = asylum_drop[asylum_drop["value"] != 0]
    asylum_drop = asylum_drop[(asylum_drop["age"] != "Total") & (asylum_drop["sex"] != "Total") & (asylum_drop["decision"] != "Total") & (asylum_drop["geo"] != "European Union - 27 countries (from 2020)")]
    return asylum_drop

def logistic_regression(X, y, w, alpha = 1, max_iter = None):
    """
    A function that runs logistic regression for some maximum number of iterations

    Args:
        X (array): an array of all the predictors where the rows are the observations (includes bias term)
        y (array): an array of all response values (-1 or 1)
        w (array): the initial weight vector
        alpha (double): a scalar that serves as the learning rate (default = 1)
        max_iter (int): an integer specifying the maximum number of iteraions (default = None)

    Returns:
        w (array): the final weight vector
    """
    runalg = True
    i = 0
    iter = 0
    
    while runalg:

        x = X[i, :]
        yhat = 1/(1 + np.exp(-np.dot(x, w)))

        w = w - alpha*(yhat - y[i])*x
        i += 1

        if i == len(y):
            i = 0
            iter += 1

        if max_iter != None:
            if iter == max_iter:
                runalg = False
                print(f"Algorithm reached max_iter, final w = {w}")
                print(f"Total number of iterations = {iter}")
                break
                    
    return w


def predict_logistic(x, w, pred0 = True):
    if pred0 == True:
        yhat = 1/(1 + np.exp(np.dot(x, w)))
    else:
        yhat = np.exp(np.dot(x, w))/(1 + np.exp(np.dot(x, w)))
    return yhat

def predictedDF(y, yhati):
    #adding predicted to the data frame
    plt.scatter(y, yhati, alpha=0.5)
    plt.title('Actual vs Predicted Acceptance Rates')
    plt.xlabel('Actual Acceptance Rate')
    plt.ylabel('Predicted Acceptance Rate')
    plt.show()
    print('Correlation', np.corrcoef(y, yhati)**2)

def resHistogram(res):
    #histogram of reisduals
    sns.histplot(res, kde=False)
    plt.xlabel("residuals")
    plt.title("histogram of residuals")
    plt.show()
    #Normal around -15

def autocorrelationScatter(x, res):
    #Assessing no autocorrelation
    plt.scatter(range(len(x)), res, alpha=0.5)
    plt.xlabel("index")
    plt.ylabel("residuals")
    plt.title("residual plot vs. order")
    plt.show()

def residualVsX(x, res):
    plt.scatter(x, res, alpha = .5)
    plt.xlabel("acceptance rate")
    plt.ylabel("residuals")
    plt.title("residual plot vs. x values")
    plt.show()

def predict_acceptance(age, sex, citizen, one_hot_template, w):
    input_vector = np.zeros(one_hot_template.shape[1])
    col_names = one_hot_template.columns

    if f"age_{age}" in col_names:
        input_vector[col_names.get_loc(f"age_{age}")] = 1
    if f"sex_{sex}" in col_names:
        input_vector[col_names.get_loc(f"sex_{sex}")] = 1
    if f"citizen_{citizen}" in col_names:
        input_vector[col_names.get_loc(f"citizen_{citizen}")] = 1

    input_vector = np.insert(input_vector, 0, 1)

    yhat = predict_logistic(input_vector, w, pred0=False)
    return yhat

merged = pd.read_csv('long_data_accrate.csv')
one_hot_df= pd.read_csv('wide_data_X.csv')

X = np.array(one_hot_df)
X = np.column_stack([np.ones(X.shape[0]), X])
y = merged['acceptance_rate'].to_numpy()
w = np.random.randn(176,)
b = np.matmul(np.linalg.inv(np.matmul(X.T, X)), np.matmul(X.T, y))
res = y - np.matmul(X, b)
x = merged["acceptance_rate"]

run = logistic_regression(X, y, w, alpha = .007, max_iter = 1000)
yhati = np.apply_along_axis(predict_logistic, 1, X, pred0 = False, w=run)
predictedDF(y, yhati)
resHistogram(res)
autocorrelationScatter(x, res)
residualVsX(x, res)