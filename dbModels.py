from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from datetime import datetime

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'oracle://username:password@ip:port/xe'
db = SQLAlchemy(app)



def get_time_token():
    return datetime.now().strftime('%Y%m%d%H%M%S')


class Book(db.Model):
    '''
    1.Book  -- 预定表
        预定单ID-预约时间（小时/分钟/秒）-预约日期-预定人数-是否超过5个
        bookID-createTime-bookTime-bookDate-countPeople-isOverFive
        str(20) datetime  str(20)                 datetime  int      int 0/1
        主键                                               0/1默认0

        此表定义触发器，在插入数据的时候转换bookDate为Oracle的Datetime数据类型(to_date)
    '''
    __tablename__ = 'YRH_Book'
    bookID = db.Column(db.String(20), primary_key=True)
    bookTime = db.Column(db.String(20))
    bookDate = db.Column(db.DateTime)
    countPeople = db.Column(db.Integer)
    isOverFive = db.Column(db.Integer, default=0)

    def __init__(self, bookTime, bookDate, countPeople):
        self.bookID = get_time_token()
        self.bookTime = bookTime
        # 巨坑，字符串转成datetime
        self.bookDate = datetime.strptime(bookDate, "%Y-%m-%d")
        self.countPeople = countPeople
        # self.isOverFive = 1 if countPeople > 5 else 0
        # print(self.bookDate)

    def __repr__(self):
        return '<Book {}>'.format(self.bookID)



class Recipe(db.Model):
    '''
    2.Recipe  -- 食谱
        食谱ID-图片ID-食谱名称-食谱描述
        recipeID-img_ID-recipeName-recipeDescribe
        str(20)-str(20)-str(50)-text
         主键   外键
    '''
    __tablename__ = 'YRH_Recipe'
    recipeID = db.Column(db.String(20), primary_key=True)
    imgID = db.Column(db.String(20), db.ForeignKey('YRH_Image.imgID'))
    recipeName = db.Column(db.String(50))
    recipeDescribe = db.Column(db.Text)

    comment = db.relationship('Comment', backref='Recipe', lazy='select')

    def __repr__(self):
        return '<Recipe {}, {}>'.format(self.recipeID, self.recipeName)



class Image(db.Model):
    '''
    3.image  -- 图片
        图片ID-图片路径
        imgID-imgPath
        str(20)-str(50)
         主键
    '''
    __tablename__ = 'YRH_Image'
    imgID = db.Column(db.String(20), primary_key=True)
    imgPath = db.Column(db.String(50))

    recipe = db.relationship('Recipe', backref='Image', lazy='select', uselist=False)
    chef = db.relationship('Chef', backref='Image', lazy='select', uselist=False)

    def __repr__(self):
        return '<Image {}, {}>'.format(self.imgID, self.imgPath)




class Comment(db.Model):
    '''
    4.Comments  -- 食谱的评论
        评论ID-食谱ID-评论者的名字-评论者的邮箱-评论者的电话-评论的内容-发表的时间
        commID-recipe_ID-createTime-viewerName-viewerEmail-viewerPhone-comm-createTime
        str(20)-str(20)-datatime-str(20)-str(50)-str(50)-text-datetime
        主键   外键
    '''
    __tablename__ = 'YRH_Comment'
    commID = db.Column(db.String(20), primary_key=True)
    recipeID = db.Column(db.String(20), db.ForeignKey('YRH_Recipe.recipeID'))
    viewerName = db.Column(db.String(20))
    viewerEmail = db.Column(db.String(50))
    viewerPhone = db.Column(db.String(50))
    comm = db.Column(db.Text)
    createTime = db.Column(db.DateTime, default=datetime.now)

    def __init__(self, recipeID, viewerName, viewerEmail, viewerPhone, comm):
        self.commID = get_time_token()
        self.recipeID = recipeID
        self.viewerName = viewerName
        self.viewerEmail = viewerEmail
        self.viewerPhone = viewerPhone
        self.comm = comm

    def __repr__(self):
        return '<Comment {}, {}>'.format(self.commID, self.recipeID)



class Detail(db.Model):
    '''
    5.About  -- 详细信息表
        电话-邮箱-地址
        phone-email-address
        str(20)-str(50)-str(100)
    '''
    __tablename__ = 'YRH_Detail'
    phone = db.Column(db.String(20), primary_key=True)
    email = db.Column(db.String(50))
    address = db.Column(db.String(100))

    def __repr__(self):
        return '<Detail {}>'.format(self.phone)


class Chef(db.Model):
    '''
    6.Chef  -- 厨师
        厨师ID-厨师名称前-厨师名称后-厨师照片-个人简介
        chefID-firstName-lastName-photo-describe
        str(20)-str(20)-str(20)-str(20)-text
         主键           外键
    '''
    __tablename__ = 'YRH_Chef'
    chefID = db.Column(db.String(20), primary_key=True)
    firstName = db.Column(db.String(20))
    lastName = db.Column(db.String(20))
    photo = db.Column(db.String(20), db.ForeignKey('YRH_Image.imgID'))
    describe = db.Column(db.Text)

    def __repr__(self):
        return '<Chef {}, {}, {}>'.format(self.chefID, self.firstName, self.lastName)


class Contact(db.Model):
    '''
    7.Contact  -- 联系我们（意见）
        意见ID-名字-邮箱-内容
        sugID-name-email-describe
        str(20)-datetime-str(20)-str(50)-text
         主键
    '''
    __tablename__ = 'YRH_Contact'
    sugID = db.Column(db.String(20), primary_key=True)
    name = db.Column(db.String(20))
    email = db.Column(db.String(50))
    describe = db.Column(db.Text)

    def __init__(self, name, email, describe):
        self.sugID = get_time_token()
        self.name = name
        self.email = email
        self.describe = describe

    def __repr__(self):
        return '<Contact {}, {}>'.format(self.sugID, self.name)