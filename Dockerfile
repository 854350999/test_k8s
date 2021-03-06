# 从仓库拉取 带有 python 3.8 的 Linux 环境
FROM python:3.8

# 设置 python 环境变量
ENV PYTHONUNBUFFERED 1

# 创建 code 文件夹并将其设置为工作目录
RUN mkdir /test_k8s
WORKDIR /test_k8s
# 更新 pip
RUN pip install pip -U
# 将 requirements.txt 复制到容器的 code 目录
ADD requirements.txt /test_k8s/
# 安装库
RUN pip install -i https://pypi.tuna.tsinghua.edu.cn/simple -r requirements.txt
# 将当前目录复制到容器的 code 目录
ADD . /test_k8s/