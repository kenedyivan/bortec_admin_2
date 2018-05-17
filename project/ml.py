import mysql.connector
import pandas as pd
import numpy as np


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

    def printsql(self):
        print(self.data_list)


obj = Robo()
obj.printPandas()
