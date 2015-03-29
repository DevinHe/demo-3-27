== README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
### README

#### 这是一个简单的Demo项目，实现了一个基本的有数据库支持的网站。[在线Demo](http://oa.sccsa.org.cn:3000/)

---------------------------
#####实现的功能有：

* 页面显示：
  * 当用户登录的时候显示：“{用户名字} 谢谢你登录了我们网站！你已经登录了 {N} 次了，总共登录时间是 {M} 分钟了。 ”
  * 当用户未登录的时候显示：“你好，陌生人！你没有登录，或者你还没有注册，但是你已经浏览这个页面 {M} 分钟了。”
  * 所有用户都可以看到：“现在总共有 {n} 个注册用户在查看这个网站，有 {m} 个陌生人在查看这个网站”
* 用户注册功能，注册时用户名和密码为必填项，邮箱为选填。
* 实现一个`/api/v1/user_count/all.json`API接口，当请求这个接口的时候，返回当前在看网页的注册用户数和陌生用户数，请用JSON格式。

Note: 在线用户统计，默认为5分钟。

####使用方法
```
  git clone git@github.com:DevinHe/demo-3-27.git
  cd demo-3-27
  mv config/initializers/devise.rb.default config/initializers/devise.rb
  mv config/database.yml.default config/database.yml
  mv config/secrets.yml.default config/secrets.yml
  rake db:setup
  rake db:migrate
  rails s
```
###License
MIT.