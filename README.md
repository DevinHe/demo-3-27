### README
[ ![Codeship Status for DevinHe/demo-3-27](https://codeship.com/projects/db694cc0-10c2-0133-224c-5a9b1173a114/status?branch=master)](https://codeship.com/projects/92080)
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

#####依赖
* redis（localhost:6379,可通过修改config/initializers/redis_connection.rb来配置）

#####使用方法
```
  git clone git@github.com:DevinHe/demo-3-27.git
  cd demo-3-27
  mv config/initializers/devise.rb.default config/initializers/devise.rb
  mv config/database.yml.default config/database.yml
  mv config/secrets.yml.default config/secrets.yml
  rake db:setup
  rails s
```

#####TO DO LIST
  * 完善测试用例
  * 添加国际化
  * 将一些保密文件采用config_for形式加载参数

#####License
MIT.
