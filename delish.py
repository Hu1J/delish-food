from flask import Flask, render_template, request, abort
from dbModels import db, Book, Recipe, Image, Comment, Chef, Contact

app = Flask(__name__)
db.create_all()


'''
返回首页index.html
'''
@app.route('/')
@app.route('/index', methods=['GET'])
def index():
    img_p = Image.query.filter(Image.imgID.startswith('p')).all()
    img_bl = Image.query.filter(Image.imgID.startswith('bl')).all()
    recipe_list = []
    links = [
        'single?recipe=r201812001',
        'single?recipe=r201812002',
        'single?recipe=r201812003',
        'single?recipe=r201812004'
    ]
    img_s = Image.query.filter(Image.imgID.like("s%.jpg")).all()

    for link, img in zip(links, img_s):
        recipe = [link, img]
        recipe_list.append(recipe)

    example_recipe = Recipe.query.filter(Recipe.imgID.startswith('b')).all()

    # print('-------------In func index---------------')
    # print(img_p)
    # print(img_bl)
    # print(img_s)
    # print(recipe_list)
    # print(example_recipe)


    return render_template(
        'index.html',
        img_p=img_p,
        img_bl=img_bl,
        example_recipe=example_recipe,
        recipe_list=recipe_list
    )


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

    # print('-----------In func book------------')
    # print(bookTime)
    # print(bookDate)
    # print(countPeople)

    book = Book(bookTime, bookDate, int(countPeople))

    try:
        db.session.add(book)
        db.session.commit()
    except:
        return '<h1>Unknow bug...</h1>', 500

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
    img_g = Image.query.filter(Image.imgID.startswith('g')).all()
    img_g1 = img_g[0:3]
    img_g2 = img_g[3:6]
    img_g3 = img_g[6:9]

    # print('-----------In func gallery-----------')
    # print(img_g)
    # print(img_g1)
    # print(img_g2)
    # print(img_g3)

    return render_template(
        'gallery.html',
        img_g1=img_g1,
        img_g2=img_g2,
        img_g3=img_g3
    )


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
        return '<h1>只支持输入英文...</h1>', 500

    return render_template('thank.html'), 200


'''
返回single.html
'''
@app.route('/single')
def single():
    recipeid = request.args.get('recipe')

    if not recipeid:
        recipeid = 'r201812001'


    recipe = Recipe.query.filter(Recipe.recipeID == recipeid).first()
    image = Image.query.filter(Image.imgID == recipe.imgID).first()
    reviews = Comment.query.filter(Comment.recipeID == recipeid).all().order_by(Comment.createTime)

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

    if not recipeid:
        recipeid = 'r201812001'

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
        return '<h1>只支持输入英文评论...</h1>', 500

    return render_template('thank.html'), 200