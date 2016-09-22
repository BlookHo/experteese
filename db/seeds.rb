# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Image.delete_all
Image.reset_pk_sequence
Image.create([

{name: 'P.-A. Renoir, Бал в Мулен де ла Галетт', file: 'Ball_Renour.jpg', theme_id: 2},
{name: 'P. Picasso, Фабрика', file: 'Picasso Fabrique.jpg', theme_id: 3},
{name: 'H. Matiss, Танец', file: 'dance_mattis2.jpg', theme_id: 4},
{name: 'радуга', file: 'raduga5обрез.jpg', theme_id: 7},
{name: 'Кандинский В.В., Жёлтое-красное-синее', file: 'Кандинский_ж.к.г_авапг.jpg', theme_id: 5},
{name: 'A. Raynaud, Ночь', file: 'Рейно_Ночь_класс.jpg', theme_id: 7},
{name: 'Серый - стандарт', file: 'Серый - середина - стандарт.jpg', theme_id: 7},
{name: 'Черно-Белый - стандарт', file: 'Черно-Белый - стандарт.jpg', theme_id: 7},
{name: 'Черный - стандарт', file: 'Черный лист - стандарт.jpg', theme_id: 7},
{name: 'P. Picasso, Авиньонские девицы', file: 'Picasso Авиньонские девицы.jpg', theme_id: 3},
{name: 'P. Picasso, Герника', file: 'Picasso Герника.jpg', theme_id: 3},
{name: 'P. Picasso, Голубь мира', file: 'Picasso Голубь мира.jpg', theme_id: 3},
{name: 'P. Picasso, Дама с веером', file: 'Picasso Дама с веером.jpg', theme_id: 3},
{name: 'P. Picasso, Испанская пара перед гостиницей', file: 'Picasso Испанская пара перед гостиницей.jpg', theme_id: 3},
{name: 'P. Picasso, Кот, поедающий птичку', file: 'Picasso Кот, поедающий птичку.jpg', theme_id: 3},
{name: 'P. Picasso, Любительница абсента', file: 'Picasso Любительница абсента.jpg', theme_id: 3},
{name: 'P. Picasso, Натюрморт', file: 'Picasso Натюрморт.jpg', theme_id: 3},
{name: 'P. Picasso, Портрет Доры Маар', file: 'Picasso Портрет Доры Маар.jpg', theme_id: 3},
{name: 'P. Picasso, Средиземноморский пейзаж', file: 'Picasso Средиземноморский пейзаж.jpg', theme_id: 3},
{name: 'P. Picasso, Стекляная посуда', file: 'Picasso Стекляная посуда.jpg', theme_id: 3},
{name: 'V.W. van Gogh, Куст', file: 'ван_гог_куст2.jpg', theme_id: 6}

])

Theme.delete_all
Theme.reset_pk_sequence
Theme.create([
  
{name: "-----"},      # 1
{name: "Какое из произведений художника О.Ренуара наилучшим образом характеризует его творчество?"},      # 2
{name: "Какое из произведений художника П.Пикассо наилучшим образом характеризует его творчество?"},      # 3
{name: "Какое из произведений художника А.Матисса наилучшим образом характеризует его творчество?"},      # 4
{name: "Какое из произведений художника В.Кандинского наилучшим образом характеризует его творчество?"},  # 5
{name: "Какое из произведений художника В.ван Гога наилучшим образом характеризует его творчество?"},     # 6
{name: "Какое из изображений является наиболее гармоничным по вашему восприятию?"}                        # 7

])


User.delete_all
User.reset_pk_sequence
User.create([
  
{name: "Алексей", email: "zoneiva@gmail.com", password: "222222", password_confirmation: "222222"},
{name: "Петр", email: "blookho@gmail.com", password: "222222", password_confirmation: "222222"},
{name: "Анна", email: "annach61@mail.ru", password: "222222", password_confirmation: "222222"},
{name: "Example User", email: "example@railstutorial.org", password: "222222", password_confirmation: "222222"},
{name: "Федор", email: "fedor@yandex.ru", password: "222222", password_confirmation: "222222"}

])



Micropost.delete_all
Micropost.reset_pk_sequence
Micropost.create([
  
{content: 'Привет! Я хотел бы поработать здесь!', user_id: 1, created_at: '2016-09-03 09:00:51.675013'},
{content: 'И я бы не отказался!', user_id: 2, created_at: '2016-09-03 09:01:13.409288'},
{content: 'Посмотри на мой код: https://github.com/BlookHo/bloGNote', user_id: 1, created_at: '2016-09-03 09:01:58.165727'},
{content: 'Я хотела бы оценить Picasso', user_id: 3, created_at: '2016-09-03 09:02:31.546702'},
{content: 'И я бы не против. Нужно админам поработать! )', user_id: 2, created_at: '2016-09-03 09:03:03.244806'},
{content: 'Мой очень длинный пост: ЖЖЖЖЖЖЖЖЖЖЖЖЖЖЖЖЖЖЖЖЖЖЖЖЖЖ', user_id: 1, created_at: '2016-09-03 09:22:49.623447'}

])

