import numpy as np
import os
import time
from keras import models,Model
from sklearn.externals import joblib
import pymysql

def loadModel():
    '''
    :return: load networkmodel and svmmodel
    '''
    file_path=os.path.dirname(os.path.realpath(__file__))
    nn_modle = os.path.join(file_path,"NetworkModel.h5")
    cnn_model = models.load_model(nn_modle)
    cnn_model.trainable = False
    #
    dense1_layer_model = Model(inputs=cnn_model.input, outputs=cnn_model.get_layer(name='dense_1').input)
    dense1_layer_model.trainable = False
    #    keras2pmml(estimator=dense1_layer_model.trainable, file='model.pmml')

    # 加载svm.pkl
    svm_modle = os.path.join(file_path,"SVMModel.pkl")
    new_svm = joblib.load(svm_modle)

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
    # 打开数据库连接
    db = pymysql.connect("localhost", "root", "mysql", "yf15")

    # 使用 cursor() 方法创建一个游标对象 cursor
    cursor = db.cursor()
    # 使用 execute()  方法执行 SQL 查询
    cursor.execute("SELECT WellDepth, HangDownDeep, DepthOfTheDrillBit, DrillDownDeep, DrillingTime, BitPressure, "
                   "HangingLoad, RotationRate, Torque, KellyDown, HookPosition, HookSpeed, StandpipePressureLog, "
                   "CasingPressure, PumpStroke1, PumpStroke2, PumpStroke3, TotalPoolSize, LayTime, MudSpill, "
                   "InletFlowlog, OutletFlowlog, InletDensitylog, OutletDensitylog, EntranceTempreture, ExitTempreture, "
                   "TotalHydrocarbon, H2S, C1, C2, PWDHangDownDeep, PWDAnnularPressure, PWDWellDeviation, PWDLocation, "
                   "UpturnDepth, OperatorSchema, StandpipePressure, MeasurementOfBackPressure, OutletFlow, OutletDensity, "
                   "BackPressurePumpFlow, LoopBackPressure, AdditionalBackPressure, InletFlow, FixDepth, FixPointDownDeep, "
                   "FixPointPressure, WellMouthAdjustment, FixPointPressureLoss, FixPointECD, DrillECD, DrillStringPressureDrop, "
                   "DrillBitPressureDrop, EnvironmentalControlPressureLoss, TargetBackPressure, HydrostaticPressure"
                   " from oil order by Time desc limit 500")

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

def pythonModel():
    network, svmmodel = loadModel()
    data = readdata()
    data = standardize(data)
    return invokeModel(data, network=network, svmmodel=svmmodel)

if __name__ == '__main__':
    print(pythonModel())

