# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if Board.first.nil?
  grid_size = 5

  assignments = %w[neutral
                   red
                   red
                   neutral
                   blue
                   blue
                   blue
                   neutral
                   neutral
                   blue
                   neutral
                   blue
                   red
                   blue
                   blue
                   red
                   blue
                   neutral
                   bomb
                   blue
                   red
                   red
                   red
                   red
                   neutral]

  words = %w[PERKAL TRAPEZ KSIĘŻYC OGON TRUCIZNA SĘDZIA DWORZEC MYSZ KOD AKTA
             KOTWICA KRAB POWÓDŹ LICENCJA WYKRYWACZ MŁYN UCZTA WDOWA OŁÓW KOFEINA
             NABÓJ KALEKA SUFIT NÓŻ NOC]

  tiles = words.each_with_index.map do |word, index|
    {
      index: index,
      assigment: assignments[index],
      word: word,
      status: 'default',
      starting_team: 'blue'
    }
  end

  Board.create(code: 'myboard', grid_size: grid_size, tiles: tiles, status: 'in_progress', starting_team: 'blue')

end
