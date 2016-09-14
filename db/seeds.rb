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

{name: 'P.-A. Renoir, Бал в Мулен де ла Галетт', file: 'Ball_Renour.jpg'},
{name: 'P. Picasso, Фабрика', file: 'Picasso Fabrique.jpg'},
{name: 'H. Matiss, Танец', file: 'dance_mattis2.jpg'},
{name: 'радуга', file: 'raduga5обрез.jpg'},
{name: 'Кандинский В.В., Жёлтое-красное-синее', file: 'Кандинский_ж.к.г_авапг.jpg'},
{name: 'A. Raynaud, Ночь', file: 'Рейно_Ночь_класс.jpg'},
{name: 'Серый - стандарт', file: 'Серый - середина - стандарт.jpg'},
{name: 'Черно-Белый - стандарт', file: 'Черно-Белый - стандарт.jpg'},
{name: 'Черный - стандарт', file: 'Черный лист - стандарт.jpg'},
{name: 'V.W. van Gogh, Куст', file: 'ван_гог_куст2.jpg'}

])



User.delete_all
User.reset_pk_sequence
User.create([
  
{name: "Алексей", email: "zoneiva@gmail.com", password: "222222", password_confirmation: "222222"},
{name: "Петр", email: "blookho@gmail.com", password: "222222", password_confirmation: "222222"},
{name: "Анна", email: "annach61@mail.ru", password: "222222", password_confirmation: "222222"},
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

