user1 = User.create(name: "squirrel", username: "stupid", password: "idiot")
user2 = User.create(name: "name", username: "alpha", password: "bet")

Url.create(url: "http://www.google.com")
Url.create(url: "http://craigslist.org")

user2.urls.create(url: "http://www.cnn.com")
