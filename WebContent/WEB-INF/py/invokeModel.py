# coding:utf-8
import socket   # 导入 socket 模块

def test_client():

    s = socket.socket()  # 创建 socket 对象
    host = socket.gethostname()  # 获取本地主机名
    port = 12345  # 设置端口
    addr = (host, port)

    s.connect(addr)  # 绑定端口号
    print(s.recv(1024).decode())  # 打印接收的数据
    s.close()  # 关闭连接

if __name__ == "__main__":
    test_client()
