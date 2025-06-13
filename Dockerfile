FROM python:3.11-slim

# 安装系统依赖
RUN apt-get update && apt-get install -y build-essential

# 设置工作目录
WORKDIR /app

# 安装Python依赖
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 拷贝源代码
COPY app /app

# 启动服务（你可以用 --reload 开启热更新）
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
