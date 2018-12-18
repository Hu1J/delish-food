from flask import Flask, render_template, request, abort
from dbModels import db, Book, Recipe, Image, Comment, Chef, Contact

app = Flask(__name__)
db.create_all()


'''
返回首页index.html
'''
@app.route('/')
@app.route('/index')
def index():
    return render_template('index.html')


'''
index页面，提交预订单
book函数处理
'''
@app.route('/book', methods=['POST'])
def book():
    bookTime = request.form["bookTime"]
    bookDate = request.form["bookDate"]
    countPeople = request.form["countPeople"]

    bookTime = 'NULL' if bookTime == '' else bookTime
    countPeople = countPeople.split(' ')[0] if countPeople != 'More' else -1
    t = bookDate.split('/')
    y, m, d = t[2], t[0], t[1]
    bookDate = '{}-{}-{}'.format(y, m, d)

    # print(bookTime)
    # print(bookDate)
    # print(countPeople)

    book = Book(bookTime, bookDate, int(countPeople))

    try:
        db.session.add(book)
        db.session.commit()
    except:
        return '<h1>Unkown bug...</h1>', 500

    return render_template('thank.html'), 200


'''
返回about.html
'''
@app.route('/about')
def about():
    chefs = Chef.query.all()
    images = []
    for chef in chefs:
        images.append(Image.query.filter(Image.imgID == chef.photo).first())

    # print('-------------In func about--------------')
    # print(chefs)
    # print(images)

    return render_template(
        'about.html',
        chefs=chefs,
        images=images
    )


'''
返回services.html
'''
@app.route('/services')
def services():
    return render_template('services.html')


'''
返回gallery.html
'''
@app.route('/gallery')
def gallery():
    return render_template('gallery.html')


'''
访问icons和codes将被禁止
'''
@app.route('/codes')
@app.route('/icons')
def not_allow():
    abort(401)
    return '<h1>Visit this page is not allow!!!</h1>', 401


'''
返回contact.html
'''
@app.route('/contact')
def contact():
    return render_template('contact.html')


'''
Contact页面，提交意见
suggest
'''
@app.route('/suggest', methods=['POST'])
def suggest():
    name = request.form["Name"]
    email = request.form["Email"]
    message = request.form["Message"]

    try:
        cont = Contact(name, email, message)
        db.session.add(cont)
        db.session.commit()
    except:
        return '<h1>Unkown bug...</h1>', 500

    return render_template('thank.html'), 200


'''
返回single.html
'''
@app.route('/single')
def single():
    recipeid = request.args.get('recipe')

    recipe = Recipe.query.filter(Recipe.recipeID == recipeid).first()
    image = Image.query.filter(Image.imgID == recipe.imgID).first()
    reviews = Comment.query.filter(Comment.recipeID == recipeid).all()

    # print('-------------In func single-------------')
    # print(recipeid)
    # print(recipe.recipeDescribe.encode('utf-8'))
    # print(image.imgPath)
    # print(reviews)

    return render_template(
        'single.html',
        imgPath=image.imgPath,
        recipe=recipe,
        reviews=reviews
    )


'''
响应提交评论
sendReview
'''
@app.route('/sendReview', methods=['POST'])
def sendReview():
    name = request.form['name']
    email = request.form['email']
    phone = request.form['phone']
    message = request.form['message']
    recipeid = request.referrer.split('=')[-1]

    # print('-------------In func sendReview-------------')
    # print(recipeid)
    # print(name)
    # print(email)
    # print(phone)
    # print(message)

    try:
        review = Comment(recipeid, name, email, phone, message)
        db.session.add(review)
        db.session.commit()
    except:
        return '<h1>Unkown bug...</h1>', 500

    return render_template('thank.html'), 200