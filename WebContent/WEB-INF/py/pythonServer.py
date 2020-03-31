# coding:utf-8
import numpy as np
import datetime
from keras import models,Model
from sklearn.externals import joblib
import pymysql
import socket   # 导入 socket 模块
import os

def test_server():
    # 创建模型
    network, svmmodel = loadModel()

    # 创建socket通信
    s = socket.socket()  # 创建 socket 对象
    host = socket.gethostname()  # 获取本地主机名
    port = 12345  # 设置端口
    addr = (host, port)  # 设置地址tuple
    s.bind(addr)  # 绑定端口

    s.listen(10)  # 等待客户端连接
    while True:
        # 客户端连接成功开始通信

        c, addr = s.accept()  # 接收客户端的连接

        # 预测模型
        data = readdata()
        data = standardize(data)
        output = invokeModel(data, network=network, svmmodel=svmmodel)

        print(str(datetime.datetime.now()) + " " + str(output))

        c.sendall(str(output).encode())
        c.close()  # 关闭连接

def loadModel():
    '''
    :return: load networkmodel and svmmodel
    '''
    #path = os.path.split(os.path.realpath(__file__))[0].replace("\\", "\\\\")
    #cnn_model = models.load_model(path + "\py\classify1CNN.h5")
    file_path=os.path.dirname(os.path.realpath(__file__))
    nn_modle = os.path.join(file_path,"classify1CNN.h5")
    cnn_model = models.load_model(nn_modle)
    cnn_model.trainable = False
    #
    dense1_layer_model = Model(inputs=cnn_model.input, outputs=cnn_model.get_layer(name='dense_1').input)
    dense1_layer_model.trainable = False
    #    keras2pmml(estimator=dense1_layer_model.trainable, file='model.pmml')

    # 加载svm.pkl
    svm_modle = os.path.join(file_path,"svm.pkl")
    new_svm = joblib.load(svm_modle)
    dense1_layer_model.summary()
    return dense1_layer_model, new_svm

def invokeModel(data, network, svmmodel):
    '''
    :param data: the data of the drill
           network: CNN+LSTM
           svm: SVM CLF
    :return : if the complicated conditions happen
    '''
    x = network.predict(data)
    output = svmmodel.predict(x)
    return output

def readdata():
    '''

    :return: data from the mysql
    '''
    seq_len = 500
    feathers = 56
    # 打开数据库连接：3308，mysql
    #db = pymysql.connect("127.0.0.1", "root", "", "yf15")
    db = pymysql.connect(
    host='localhost',
    port=3306,
    user='root',
    passwd='mysql',
    db='yf15',
    charset='gb2312'
)

    # 使用 cursor() 方法创建一个游标对象 cursor
    cursor = db.cursor()
    # 使用 execute()  方法执行 SQL 查询
    cursor.execute("SELECT WellDep, HangDownDeep, DepthOfTheDrillBit, DrillDownDeep, DrillingTime, BitPressure, "
                   "HangingLoad, RotationRate, Torque, KellyDown, HookPosition, HookSpeed, StandpipePressureLog, "
                   "CasingPressure, PumpStroke1, PumpStroke2, PumpStroke3, TotalPoolSize, LayTime, MudSpill, "
                   "InletFlowlog, OutletFlowlog, InletDensitylog, OutletDensitylog, EntranceTempreture, ExitTempreture, "
                   "TotalHydrocarbon, H2S, C1, C2, PWDHangDownDeep, PWD_hkyl, PWDWellDeviation, PWDLocation, "
                   "UpturnDepth, OperatorSchema, StandpipePressure, MeasurementOfBackPressure, OutletFlow, OutletDensity, "
                   "BackPressurePumpFlow, LoopBackPressure, AdditionalBackPressure, InletFlow, FixDepth, FixPointDownDeep, "
                   "FixPointPressure, WellMouthAdjustment, FixPointPressureLoss, FixPointECD, DrillECD, DrillStringPressureDrop, "
                   "DrillBitPressureDrop, EnvironmentalControlPressureLoss, TargetBackPressure, HydrostaticPressure"
                   " from oil_2 order by Time desc limit 500")

    # 使用 fetchone() 方法获取单条数据.
    data = cursor.fetchall()
    data = np.array(data)
    data.reshape((seq_len, feathers))
    # 关闭数据库连接
    db.close()
    return data

def standardize(X_train):
    """ Standardize data """
    shape = X_train.shape
    for i in range(shape[1]):
        p = np.max(X_train[:,i]) - np.min(X_train[:,i])
        if p != 0:
            X_train[:,i] = (X_train[:,i] - np.min(X_train[:,i])) / p
        else:
            for j in range(shape[0]):
                X_train[j, i] = 0
    X_train = X_train[np.newaxis, :, :]

    return X_train

if __name__ == "__main__":
    test_server()