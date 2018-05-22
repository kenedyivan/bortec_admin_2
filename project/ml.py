import mysql.connector
import pandas as pd
import numpy as np
from sklearn import preprocessing, svm, model_selection
from sklearn.linear_model import LinearRegression


class Robo(object):

    def __init__(self):
        self.data_list = ''
        self.df_mysql = ''
        self.dbuser = 'phpmyadmin'
        self.dbpassword = '123!@#QWEasd'
        self.withPandas()

    def getData(self):
        conn = mysql.connector.connect(user=self.dbuser, password=self.dbpassword, host='localhost',
                                       database='bortec_inv_system_db')
        cursor = conn.cursor()
        cursor.execute('SELECT item_id, '
                       'AVG(temp) AS temp, '
                       'AVG(temp_min) AS tmin, '
                       'AVG(temp_max) AS tmax, '
                       'AVG(pressure) AS pressure, '
                       'AVG(humidity) AS humidity, '
                       'AVG(wind_speed) AS wind_speed, '
                       'AVG(fuel_price) AS fuel, '
                       'SUM(quantity) AS quantity, '
                       'date(created_at) AS date '
                       'FROM `sales` '
                       'WHERE '
                       'item_id=1 '
                       'GROUP BY '
                       'date(created_at), '
                       'item_id')

        self.data_list = cursor.fetchall()
        conn.close()
        return self.data_list

    def withPandas(self):
        conn = mysql.connector.connect(user=self.dbuser, password=self.dbpassword, host='localhost',
                                       database='bortec_inv_system_db')

        df = pd.read_sql('SELECT item_id, '
                         'AVG(temp) AS temp, '
                         'AVG(temp_min) AS tmin, '
                         'AVG(temp_max) AS tmax, '
                         'AVG(pressure) AS pressure, '
                         'AVG(humidity) AS humidity, '
                         'AVG(wind_speed) AS wind_speed, '
                         'AVG(fuel_price) AS fuel, '
                         'SUM(quantity) AS quantity, '
                         'date(created_at) AS date '
                         'FROM `sales` '
                         'GROUP BY '
                         'date(created_at), '
                         'item_id', con=conn)

        self.df_mysql = df
        return self.df_mysql

    def printPandas(self):
        print(self.df_mysql)

    def printSql(self):
        print(self.data_list)


# functional programming

dbuser = 'phpmyadmin'
dbpassword = '123!@#QWEasd'

conn = mysql.connector.connect(user=dbuser, password=dbpassword, host='localhost',
                               database='bortec_inv_system_db')

df = pd.read_sql('SELECT item_id, '
                 'AVG(temp) AS temp, '
                 'AVG(weather) AS weather, '
                 'AVG(temp_min) AS tmin, '
                 'AVG(temp_max) AS tmax, '
                 'AVG(pressure) AS pressure, '
                 'AVG(humidity) AS humidity, '
                 'AVG(wind_speed) AS wind_speed, '
                 'AVG(fuel_price) AS fuel, '
                 'SUM(quantity) AS quantity, '
                 'date(created_at) AS date '
                 'FROM `sales` '
                 'WHERE '
                 'item_id = 1 '
                 'GROUP BY '
                 'date(created_at), '
                 'item_id', con=conn)

df.columns = ['item_id', 'weather', 'temp', 'tmin', 'tmax', 'pressure', 'humidity', 'wind_speed', 'fuel', 'quantity',
              'date']

print(df)

df['weather'] = df.weather.astype(int)
df['temp'] = df.temp.astype(int)
df['tmin'] = df.tmin.astype(int)
df['tmax'] = df.tmax.astype(int)
df['pressure'] = df.pressure.astype(int)
df['humidity'] = df.humidity.astype(int)
df['wind_speed'] = df.wind_speed.astype(int)
df['fuel'] = df.fuel.astype(int)
df['quantity'] = df.quantity.astype(int)

xdf = df.drop(['item_id', 'date', 'quantity'], 1)
ydf = np.asarray(df['quantity'])

x = np.asarray(xdf)
y = ydf

x_lately = np.asarray([2, 298, 298, 298, 1014, 69, 4, 3807]).reshape(1, -1)

X_train, X_test, y_train, y_test = model_selection.train_test_split(x, y, test_size=0.2)

clf = LinearRegression(n_jobs=-1)
clf.fit(X_train, y_train)

accuracy = clf.score(X_test, y_test)

print(accuracy)

forecast_set = clf.predict(x_lately)
print(forecast_set)
