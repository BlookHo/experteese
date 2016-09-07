# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Image.delete_all
# Image.reset_pk_sequence
Image.create([

                 {name: 'Ball_Renour.jpg', path: '//hg7656yy'},
                 {name: 'Picasso Fabrique.jpg', path: '//dd hdfbhdfyy'},
                 {name: 'dance_mattis2.jpg', path: '//dfgvdfdfg'},
                 {name: 'raduga5обрез.jpg', path: '//rrbfbfhg7656yy'},
                 {name: 'Кандинский_ж.к.г_авапг.jpg', path: '//ka dfgvdfdfg'},
                 {name: 'Рейно_Ночь_класс.jpg', path: '//rrrc dfgvdfdfg'},
                 {name: 'Серый - середина - стандарт.jpg', path: '//cc hg7656yy'},
                 {name: 'Черно-Белый - стандарт.jpg', path: '//cvcv dfgvdfdfg'},
                 {name: 'Черный лист - стандарт.jpg', path: '//chchvbvb hg7656yy'},
                 {name: 'ван_гог_куст2.jpg', path: '//vsdas'}

             ])
