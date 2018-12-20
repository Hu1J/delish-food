-- Book表的触发器，当countpeople为-1时，将isoverfive置为1
create or replace trigger fix_bookDate before insert
on "YRH_Book"
for each row
begin
    if :new."countPeople" = -1 then
        :new."isOverFive":=1;
    end if;
    dbms_output.put_line('Change isOverFive: '||:new."isOverFive");
end;




INSERT INTO SCOTT."YRH_Book" ("bookID", "bookTime", "bookDate", "countPeople", "isOverFive") VALUES ('04e6c89d094f13d47a67ae61fdcde96d', '17:17', TO_DATE('2018-12-18 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), -1, 1);
INSERT INTO SCOTT."YRH_Book" ("bookID", "bookTime", "bookDate", "countPeople", "isOverFive") VALUES ('87ef629b47b383ffbf71156f9b9b85cf', '17:17', TO_DATE('2018-12-14 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 0);
INSERT INTO SCOTT."YRH_Book" ("bookID", "bookTime", "bookDate", "countPeople", "isOverFive") VALUES ('99ae8044eabbef85de64cd549f76c778', '17:42', TO_DATE('2018-12-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 0);
INSERT INTO SCOTT."YRH_Book" ("bookID", "bookTime", "bookDate", "countPeople", "isOverFive") VALUES ('ed1ea5d824b0697b9d982c8ec88397ae', '17:54', TO_DATE('2018-12-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 0);
INSERT INTO SCOTT."YRH_Book" ("bookID", "bookTime", "bookDate", "countPeople", "isOverFive") VALUES ('4358aa48662e86aba95644fd341cd322', '18:01', TO_DATE('2018-12-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0);
INSERT INTO SCOTT."YRH_Book" ("bookID", "bookTime", "bookDate", "countPeople", "isOverFive") VALUES ('47c73aa933ce54c15d7ebce5b1cef879', '18:14', TO_DATE('2018-12-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 0);
INSERT INTO SCOTT."YRH_Book" ("bookID", "bookTime", "bookDate", "countPeople", "isOverFive") VALUES ('c7f1aab81bccd3cc6db55fb9f98756db', '06:01', TO_DATE('2018-12-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 0);
INSERT INTO SCOTT."YRH_Book" ("bookID", "bookTime", "bookDate", "countPeople", "isOverFive") VALUES ('bc12f747604df5ef789eede7f1b394de', '06:01', TO_DATE('2018-12-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 0);
INSERT INTO SCOTT."YRH_Book" ("bookID", "bookTime", "bookDate", "countPeople", "isOverFive") VALUES ('24da0d653f9eedd0ecc8e542cc498970', '16:26', TO_DATE('2018-12-17 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 0);
INSERT INTO SCOTT."YRH_Book" ("bookID", "bookTime", "bookDate", "countPeople", "isOverFive") VALUES ('24da0d653f9efgee4cc8eaebcc498970', '16:43', TO_DATE('2018-12-04 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 0);
INSERT INTO SCOTT."YRH_Book" ("bookID", "bookTime", "bookDate", "countPeople", "isOverFive") VALUES ('24da0d653f9eedd0ec42eaebcc498970', '16:50', TO_DATE('2018-12-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0);
INSERT INTO SCOTT."YRH_Book" ("bookID", "bookTime", "bookDate", "countPeople", "isOverFive") VALUES ('24da0d653f9eeflhjcc8eaebcc498970', '18:36', TO_DATE('2018-12-20 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 0);


INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('s1.jpg', 'images/s1.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('s2.jpg', 'images/s2.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('s3.jpg', 'images/s3.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('s4.jpg', 'images/s4.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('s1.jpeg', 'images/s1.jpeg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('s2.jpeg', 'images/s2.jpeg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('s3.jpeg', 'images/s3.jpeg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('s4.jpeg', 'images/s4.jpeg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('t1.jpg', 'images/t1.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('t2.jpg', 'images/t2.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('t3.jpg', 'images/t3.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('t4.jpg', 'images/t4.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('bl1.jpg', 'images/bl1.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('bl2.jpg', 'images/bl2.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('p1.jpg', 'images/p1.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('p2.jpg', 'images/p2.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('p3.jpg', 'images/p3.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('p4.jpg', 'images/p4.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('p5.jpg', 'images/p5.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('p6.jpg', 'images/p6.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('g1.jpg', 'images/g1.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('g2.jpg', 'images/g2.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('g3.jpg', 'images/g3.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('g4.jpg', 'images/g4.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('g5.jpg', 'images/g5.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('g6.jpg', 'images/g6.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('g7.jpg', 'images/g7.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('g8.jpg', 'images/g8.jpg');
INSERT INTO SCOTT."YRH_Image" ("imgID", "imgPath") VALUES ('g9.jpg', 'images/g9.jpg');


INSERT INTO SCOTT."YRH_Chef" ("chefID", "firstName", "lastName", PHOTO, DESCRIBE) VALUES ('c201812001', 'Thom', 'son', 't1.jpg', 'Lorem ipsum dolor sit amet, consectetur adipi est eligendi scing elit consectetur');
INSERT INTO SCOTT."YRH_Chef" ("chefID", "firstName", "lastName", PHOTO, DESCRIBE) VALUES ('c201812002', 'Mary', 'Doe', 't2.jpg', 'Consectetur adipi lorem ipsum dolor sit amet, est eligendi scing elit consectetur.');
INSERT INTO SCOTT."YRH_Chef" ("chefID", "firstName", "lastName", PHOTO, DESCRIBE) VALUES ('c200812003', 'Victo', 'ria', 't3.jpg', 'Lorem ipsum dolor sit amet, consectetur adipi est eligendi scing elit consectetur.');
INSERT INTO SCOTT."YRH_Chef" ("chefID", "firstName", "lastName", PHOTO, DESCRIBE) VALUES ('c200812004', 'Patrick', 'Pool', 't4.jpg', 'Eligendi scing elit lorem ipsum dolor sit amet, consectetur dolore magnam aliquam');


INSERT INTO SCOTT."YRH_Recipe" ("recipeID", "imgID", "recipeName", "recipeDescribe") VALUES ('r201812001', 's1.jpeg', 'recipe001', '1. Mash chickpeas with a mud jar or spoon (no need to be completely muddy);
2. Cut celery, apple, red onion and carrot into dices.
3. Pour the diced food into a bowl filled with chickpea paste and add coriander, sunflower seeds and lemon juice.
4. Season with Dijon mustard, black pepper, nutritional yeast and salt.
5. Mix all the ingredients in the bowl evenly.
6. Spread the mixed chickpea paste on the bread and make a sandwich. Cut it in half and put it in a lunch box.');
INSERT INTO SCOTT."YRH_Recipe" ("recipeID", "imgID", "recipeName", "recipeDescribe") VALUES ('r201812002', 's2.jpeg', 'recipe002', '1. Pour whole wheat flour, salt and turmeric powder into a bowl, then add water and stir until no granules are found.
2. Pour a little oil into the pan and pour the batter into the pan. Fry the batter on both sides for 1 minute. Remove and set aside.
3. Pour vegetable oil into the pot, heat it over medium heat, add potatoes, salt and chili powder, stir well, add some water to avoid pasting the pot.
4. Cover the pot and cook for 10 minutes, stir in the middle, wait for the potatoes to boil softly.
5. Put the fried potatoes on the bread, decorate with broccoli and roll them up.
');
INSERT INTO SCOTT."YRH_Recipe" ("recipeID", "imgID", "recipeName", "recipeDescribe") VALUES ('r201812003', 's3.jpeg', 'recipe003', '1. Stir-fry white mushrooms until golden brown on both sides in a non-stick pan over medium heat, and set aside.
2. Mix the fried mushrooms with other materials and put them into the food processor. Stir them evenly and season them with salt, black pepper and chili powder according to their taste.
3. The beaten mixture is kept at rest for 15 minutes and can be adjusted to ideal consistency by flour.
4. Divide the food paste into 6 portions of similar size, knead into the shape of meat pie, and fry it in medium heat for 6-8 minutes on each side;
5. Prepare the bread crumb or other bread in half. Put lettuce and vegetarian meat pie in turn, put on a layer of vegetarian mayonnaise, and cover the crumb with the cover.
');
INSERT INTO SCOTT."YRH_Recipe" ("recipeID", "imgID", "recipeName", "recipeDescribe") VALUES ('r201812004', 's4.jpeg', 'recipe004', '1. Preheat oven to 200 degrees Celsius. Mix chickpeas with olive oil and your favorite seasonings (such as black pepper, chili powder, salt) and bake them in the oven for 30 minutes, turning them over every 10 minutes.
2. Prepare other vegetables at the same time. Mix them with olive oil and place them on a separate baking tray.
3. Bake sweet potatoes and pumpkins together for 20 minutes and beets and mushrooms for 15 minutes. Finally, roast the kale for about 7-8 minutes.
4. When roasting vegetables, mix all the ingredients of the sauce into a mixer to make sauce.
5. Once everything has been baked, put it in a big bowl together and sprinkle the seasoning.');
INSERT INTO SCOTT."YRH_Recipe" ("recipeID", "imgID", "recipeName", "recipeDescribe") VALUES ('r201812005', 'bl1.jpg', 'Roasted Heritage Carrot', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.Ut enim ad minim veniam.');
INSERT INTO SCOTT."YRH_Recipe" ("recipeID", "imgID", "recipeName", "recipeDescribe") VALUES ('r201812006', 'bl2.jpg', 'Fritto Misto', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi.Ut enim ad minim veniam.');


INSERT INTO SCOTT."YRH_Detail" (PHONE, EMAIL, ADDRESS) VALUES ('+1 (100)222-23-33', 'info@example.com', '7784 Diamonds street, California, US.
');



INSERT INTO SCOTT."YRH_Contact" ("sugID", NAME, EMAIL, DESCRIBE) VALUES ('9aed618ad6378bace4e459e69b08950e', 'YYO', 'wyzxkfx@gmail.com', 'TIAN');
INSERT INTO SCOTT."YRH_Contact" ("sugID", NAME, EMAIL, DESCRIBE) VALUES ('0d35ae7d7472d74150e33a42b70afee6', 'YAO', '123@qq.com', 'dqdq');
INSERT INTO SCOTT."YRH_Contact" ("sugID", NAME, EMAIL, DESCRIBE) VALUES ('6192195514aae9117a8afbce0fa6cbd3', 'YAORI', '123ewdad@qq.com', 'EQW');
INSERT INTO SCOTT."YRH_Contact" ("sugID", NAME, EMAIL, DESCRIBE) VALUES ('e1f005ef3db5900a2a628f8170a8b0e5', 'YYyouzhao', '2646461468@qq.com', 'I want to book but I do not know how to go to your address...
Please send me some suggest line schemas.');
INSERT INTO SCOTT."YRH_Contact" ("sugID", NAME, EMAIL, DESCRIBE) VALUES ('8d9016b81e6112c4421417fb42603ce9', 'YAORI', '123ewdad@qq.com', 'EQW');
INSERT INTO SCOTT."YRH_Contact" ("sugID", NAME, EMAIL, DESCRIBE) VALUES ('30aa4ec3d64717f8f8d35ec3408194f2', 'YYYY-MM-n', 'yaoritian@yaoritian.com', 'yaoritian');



INSERT INTO SCOTT."YRH_Comment" ("commID", "recipeID", "viewerName", "viewerEmail", "viewerPhone", COMM, "createTime") VALUES ('30aa4ec3d64717f8f8d35ec3408194f2', 'r201812001', 'wyn', '931724899@qq.com', '13107621539', 'xxx', TO_DATE('2018-12-20 17:00:21', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SCOTT."YRH_Comment" ("commID", "recipeID", "viewerName", "viewerEmail", "viewerPhone", COMM, "createTime") VALUES ('e5af59354803ac15036b4e406ba381ca', 'r201812001', 'lml', '6666666666@qq.com', '18859132576', 'hello!', TO_DATE('2018-12-20 17:00:41', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SCOTT."YRH_Comment" ("commID", "recipeID", "viewerName", "viewerEmail", "viewerPhone", COMM, "createTime") VALUES ('f6f8842d1203191fc16a735c6cc075cd', 'r201812001', 'zhugeliang', 'zhugeliang181@chengxiangfu.com', '18866666666', 'lalalalalalalalalalalalalalalalalalalala', TO_DATE('2018-12-20 18:01:50', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SCOTT."YRH_Comment" ("commID", "recipeID", "viewerName", "viewerEmail", "viewerPhone", COMM, "createTime") VALUES ('93eb8c8311520362071b9b6f8591d8c8', 'r201812001', 'app', 'xxcccss@163.com', '12134979756', 'sending a review', TO_DATE('2018-12-20 20:54:59', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SCOTT."YRH_Comment" ("commID", "recipeID", "viewerName", "viewerEmail", "viewerPhone", COMM, "createTime") VALUES ('bcfcd50d1c42337047a9f5eb91582984', 'r201812003', 'admin', '23333@qq.com', '100886', 'Thank for your suggestions~', TO_DATE('2018-12-17 17:01:57', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SCOTT."YRH_Comment" ("commID", "recipeID", "viewerName", "viewerEmail", "viewerPhone", COMM, "createTime") VALUES ('2bd7258651e96bb669d4f78ad03c0506', 'r201812003', 'Hu1J', '2948696442@qq.com', '10086', 'It look good!!!', TO_DATE('2018-12-17 15:52:31', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SCOTT."YRH_Comment" ("commID", "recipeID", "viewerName", "viewerEmail", "viewerPhone", COMM, "createTime") VALUES ('c6735bc6a9ae724f441b6e797cafabde', 'r201812001', 'HU1J', '2948696442@qq.com', '100666558', 'I could not do it, it seem defficult...', TO_DATE('2018-12-17 19:40:58', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SCOTT."YRH_Comment" ("commID", "recipeID", "viewerName", "viewerEmail", "viewerPhone", COMM, "createTime") VALUES ('b96560debabc299069bf94ec1afe63ec', 'r201812003', 'liutianqi', '23333@qq.com', '10068999', 'Tai bang le.', TO_DATE('2018-12-19 09:25:37', 'YYYY-MM-DD HH24:MI:SS'));
INSERT INTO SCOTT."YRH_Comment" ("commID", "recipeID", "viewerName", "viewerEmail", "viewerPhone", COMM, "createTime") VALUES ('f2148c506cd0d014f8aa866ec3b39e0c', 'r201812001', 'shen', '568452132@qq.com', '15860282047', 'the best', TO_DATE('2018-12-20 18:46:25', 'YYYY-MM-DD HH24:MI:SS'));



commit ;