# Oracle的大作业-基于flask的小网站
### 库依赖：
- flask
- flask_sqlalchemy=2.1
- cx_oracle

### 运行(Linux)
```
cd delish-food/
export FLASK_APP=delish.py
flask run
```

### 数据库连接说明
在**dbModels.py**的文件开头
```
app.config['SQLALCHEMY_DATABASE_URI'] ='oracle://username:password@ip:port/xe'
```
按照这种格式填写您自己的Oracle信息