# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
article = Article.create(id:0,title:"Hello",body:"Hello Hello Hello World",created_at:Time.now,updated_at:Time.now, status:"public")
article2 = Article.create(id:1,title:"Les chats sont cool",body:"Vraiment VRAIMENT VRAIMENT",created_at:Time.now,updated_at:Time.now, status:"public")
article3 = Article.create(id:3,title:"Les chiens  un peu moins cool",body:"Vraiment OU PAS ",created_at:Time.now,updated_at:Time.now, status:"public")
comment1 = Comment.create(id:0, commenter:"Hello",body:"vraimentPAS PIREEE", status:"public",article_id:0);
comment1 = Comment.create(id:1, commenter:"Secccond",body:"vraiment vraiment coool", status:"public",article_id:0);
comment1 = Comment.create(id:2, commenter:"Hilalalal",body:"Incroyable Seeeeeed", status:"public",article_id:1);
comment1 = Comment.create(id:3, commenter:"Hello World!!!!!!",body:"vraimentPAS PIREEE", status:"public",article_id:1);
