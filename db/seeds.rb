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

{name: 'P.-A. Renoir, Бал в Мулен де ла Галетт', file: 'Renoir Бал в Мулен де ла Галлет.jpg', theme_id: 2},
{name: 'P.-A. Renoir, Букет', file: 'Renoir букет.jpg', theme_id: 2},
{name: 'P.-A. Renoir, Девушка с веером', file: 'Renoir Девушка с веером.jpg', theme_id: 2},
{name: 'P.-A. Renoir, Завтрак гребцов', file: 'Renoir ЗАВТРАК ГРЕБЦОВ.jpg', theme_id: 2},
{name: 'P.-A. Renoir, Зонтики', file: 'Renoir зонтики.jpg', theme_id: 2},
{name: 'P.-A. Renoir, Лягушатник', file: 'Renoir Лягушатник.jpg', theme_id: 2},
{name: 'P.-A. Renoir, Мадам Шарпантье', file: 'Renoir Мадам Шарпантье.jpg', theme_id: 2},
{name: 'P.-A. Renoir, Новый мост в Париже', file: 'Renoir Новый мост в Париже.jpg', theme_id: 2},
{name: 'P.-A. Renoir, Портрет Жанны Самари', file: 'Renoir Портрет Жанны Самари.jpg', theme_id: 2},
{name: 'P.-A. Renoir, Речной пейзаж', file: 'Renoir Речной пейзаж.jpg', theme_id: 2},
{name: 'P. Picasso, Фабрика', file: 'Picasso Fabrique.jpg', theme_id: 3},
{name: 'H. Matiss, Балерина', file: 'Matiss Балерина.jpg', theme_id: 4},
{name: 'H. Matiss, Вид моря из Коллеура', file: 'Matiss Вид моря из Коллеура.jpg', theme_id: 4},
{name: 'H. Matiss, Гербарий', file: 'Matiss Гербарий.jpg', theme_id: 4},
{name: 'H. Matiss, Дама на терассе', file: 'Matiss Дама на терассе.jpg', theme_id: 4},
{name: 'H. Matiss, Десерт', file: 'Matiss Десерт.jpg', theme_id: 4},
{name: 'H. Matiss, Золотые рыбки', file: 'Matiss Золотые рыбки.jpg', theme_id: 4},
{name: 'H. Matiss, Игра в шарики', file: 'Matiss Игра в шарики.jpg', theme_id: 4},
{name: 'H. Matiss, Музыка', file: 'Matiss Музыка.jpg', theme_id: 4},
{name: 'H. Matiss, Одалистка с турецким стулом', file: 'Matiss Одалистка с турецким стулом.jpg', theme_id: 4},
{name: 'H. Matiss, Портрет Лидии Делекторской', file: 'Matiss Портрет Лидии Делекторской.jpg', theme_id: 4},
{name: 'H. Matiss, Разговор', file: 'Matiss Разговор.jpg', theme_id: 4},
{name: 'H. Matiss, Розовая обнажённая', file: 'Matiss Розовая обнажённая.jpg', theme_id: 4},
{name: 'H. Matiss, Роскошь, покой и наслаждение', file: 'Matiss Роскошь, покой и наслаждение.jpg', theme_id: 4},
{name: 'H. Matiss, Танец', file: 'Matiss Танец.jpg', theme_id: 4},
{name: 'H. Matiss, Танец 2', file: 'Matiss dance_mattis2.jpg', theme_id: 4},
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
{name: 'V.W. van Gogh, Автопортрет', file: 'van Gogh Автопортрет.jpg', theme_id: 6},
{name: 'V.W. van Gogh, Белый дом ночью', file: 'van Gogh Белый дом ночью.jpg', theme_id: 6},
{name: 'V.W. van Gogh, Куст 2', file: 'van Gogh ван_гог_куст2.jpg', theme_id: 6},
{name: 'V.W. van Gogh, Ветви цветущего миндаля', file: 'van Gogh Ветви цветущего миндаля.jpg', theme_id: 6},
{name: 'V.W. van Gogh, Два срезанных подсолнуха', file: 'van Gogh Два срезанных подсолнуха.jpg', theme_id: 6},
{name: 'V.W. van Gogh, Едоки картофеля', file: 'van Gogh Едоки картофеля.jpg', theme_id: 6},
{name: 'V.W. van Gogh, Звездная ночь', file: 'van Gogh Звездная ночь.jpg', theme_id: 6},
{name: 'V.W. van Gogh, Ирисы', file: 'van Gogh Ирисы.jpg', theme_id: 6},
{name: 'V.W. van Gogh, Куст', file: 'van Gogh куст.jpg', theme_id: 6},
{name: 'V.W. van Gogh, Маковое поле', file: 'van Gogh Маковое поле.jpg', theme_id: 6},
{name: 'V.W. van Gogh, Мост', file: 'van Gogh Мост.jpg', theme_id: 6},
{name: 'V.W. van Gogh, Натюрморт с картофелем', file: 'van Gogh Натюрморт с картофелем.jpg', theme_id: 6},
{name: 'Кандинский В.В., Английский сад', file: 'Кандинский Английский сад.jpg', theme_id: 5},
{name: 'Кандинский В.В., Зимний пезаж', file: 'Кандинский Зимний пезаж.jpg', theme_id: 5},
{name: 'Кандинский В.В., Зубовская площадь', file: 'Кандинский Зубовская площадь.jpg', theme_id: 5},
{name: 'Кандинский В.В., Комета', file: 'Кандинский Комета.jpg', theme_id: 5},
{name: 'Кандинский В.В., Композиция №5', file: 'Кандинский Композиция №5.jpg', theme_id: 5},
{name: 'Кандинский В.В., Композиция №6', file: 'Кандинский Композиция №6.jpg', theme_id: 5},
{name: 'Кандинский В.В., Композиция №7', file: 'Кандинский Композиция №7.jpg', theme_id: 5},
{name: 'Кандинский В.В., Осень', file: 'Кандинский Осень.jpg', theme_id: 5},
{name: 'Кандинский В.В., Осень в Баварии', file: 'Кандинский Осень в Баварии.jpg', theme_id: 5},
{name: 'Кандинский В.В., Пейзаж', file: 'Кандинский Пейзаж.jpg', theme_id: 5},
{name: 'Кандинский В.В., Черные вершины', file: 'Кандинский Черные вершины.jpg', theme_id: 5},
{name: 'Черный', file: 'Car color black.jpg', theme_id: 8},
{name: 'Синий', file: 'Car color blue.jpg', theme_id: 8},
{name: 'Коричневый беж', file: 'Car color brown biege.jpg', theme_id: 8},
{name: 'Серый', file: 'Car color gray.jpg', theme_id: 8},
{name: 'Зеленый', file: 'Car color green.jpg', theme_id: 8},
{name: 'Красный', file: 'Car color red.jpg', theme_id: 8},
{name: 'Серебряный', file: 'Car color silver.jpg', theme_id: 8},
{name: 'Розовый техно', file: 'Car color techno_pink.jpg', theme_id: 8},
{name: 'Белый', file: 'Car color white.jpg', theme_id: 8},
{name: 'Желтый', file: 'Car color yellow.jpg', theme_id: 8},
{name: 'Cat eye', file: 'cateye.jpg', theme_id: 7}

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
{name: "Какое из изображений является наиболее гармоничным по вашему восприятию?"},                       # 7
{name: "Какой цвет автомобиля является наиболее популярным в этом году?"}                                 # 8

])


Value.delete_all
Value.reset_pk_sequence


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

