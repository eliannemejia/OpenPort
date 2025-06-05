import json
import pandas as pd
import numpy as np
from flask import current_app

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
        current_app.logger.info(f'x = {x}, w = {w}')
        yhat = np.exp(np.dot(x, w))/(1 + np.exp(np.dot(x, w)))
    return yhat



def predict_acceptance(age, sex, citizen, geo, one_hot_template, w):
    input_vector = np.zeros(one_hot_template.shape[1])
    col_names = one_hot_template.columns

    if f"age_{age}" in col_names:
        input_vector[col_names.get_loc(f"age_{age}")] = 1
    if f"sex_{sex}" in col_names:
        input_vector[col_names.get_loc(f"sex_{sex}")] = 1
    if f"citizen_{citizen}" in col_names:
        input_vector[col_names.get_loc(f"citizen_{citizen}")] = 1
    if f"geo_{geo}" in col_names:
        input_vector[col_names.get_loc(f"geo_{geo}")] = 1
    
    input_vector = np.insert(input_vector, 0, 1)
    
    current_app.logger.info(f'input_vector = {input_vector}')
    yhat = predict_logistic(input_vector, w, pred0=False)
    return yhat.tolist()