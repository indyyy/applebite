CREATE DATABASE applebite;


CREATE TABLE users (
   id SERIAL4 PRIMARY KEY,
   email VARCHAR(300), 
   password_digest VARCHAR(400),
   first_name VARCHAR(100),
   last_name VARCHAR(100),
   register_date Date,
   register_time Time,
   city VARCHAR(100),
   state VARCHAR(100),
   country VARCHAR(100),
   postal_code VARCHAR(100),
   mobile_num VARCHAR(100)
 );

 CREATE TABLE adposts (
  id SERIAL4 PRIMARY KEY,
  user_id INTEGER,
  name VARCHAR(100),
  post_date Date,
  post_time Time,
  title VARCHAR(200),
  description VARCHAR(500),
  image_url1 VARCHAR(400),
  image_url2 VARCHAR(400),
  image_url3 VARCHAR(400),
  category VARCHAR(100),
  model VARCHAR(100),
  price INTEGER,
  condition VARCHAR(100)
 );

 INSERT INTO users (email, password_digest, first_name, last_name, register_date, register_time, city, state, country, postal_code, mobile_num) values('daffy@ga.com', 'scrambled password','Duck', 'Daffy', '2018-07-25', '09:30', 'Melbourne','Victoria',  'Australia', '3000', '0457123456');

 INSERT INTO users (email, password_digest, first_name, last_name, register_date, register_time, city, state, country, postal_code, mobile_num) values('walt@ga.com', 'blah blah blah','Disney', 'Walt', '1990-07-25', '12:10', 'Adelaide','South Australia',  'Australia', '8000', '0457999999');

 INSERT INTO users (email, password_digest, first_name, last_name, register_date, register_time, city, state, country, postal_code, mobile_num) values('homer@ga.com', 'doh doh doh','Homer', 'Simpson', '1999-12-31', '11:59', 'Byron Bay','Queensland',  'Australia', '5000', '9110009110');


 INSERT INTO adpost (user_id, name, post_date, post_time, title, description, image_url1, image_url2, image_url3, category, model, price, condition) values(2, 'blank','2015-05-01', '13:56', 'Mint iPhone X 64GB Silver in Box','got the phone as a present but want to sell it so I can buy a samsung', 'https://i.ebayimg.com/00/s/MTAyNFg3Njg=/z/sNcAAOSwonBaDu96/$_86.JPG','https://i.ebayimg.com/00/s/MTAyNFg3Njg=/z/sNcAAOSwonBaDu96/$_86.JPG','https://i.ebayimg.com/00/s/MTAyNFg3Njg=/z/sNcAAOSwonBaDu96/$_86.JPG','iPhone','X',350,'New'); 


INSERT INTO adpost (user_id, name, post_date, post_time, title, description, image_url1, image_url2, image_url3, category, model, price, condition) values(2, 'blinkie','2015-06-29', '15:02', 'Used iPhone 6S Plus 128GB Gold','phone fell out of my pocket while skateboarding and it might be good for anger management', 'https://i.ebayimg.com/00/s/MTAyNFg3Njg=/z/j9QAAOSwL7VWpf-c/$_86.JPG','https://i.ebayimg.com/00/s/MTAyNFg3Njg=/z/j9QAAOSwL7VWpf-c/$_86.JPG','https://i.ebayimg.com/00/s/MTAyNFg3Njg=/z/j9QAAOSwL7VWpf-c/$_86.JPG','iPhone','6S Plus',15,'Damaged'); 

 