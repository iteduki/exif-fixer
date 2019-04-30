# frozen_string_literal: true

require 'mini_exiftool'

files = Dir.glob('images/*{jpg,jpeg,png}')
p files.count

current = DateTime.now
files.each_with_index do |file, i|
  p file
  photo = MiniExiftool.new file
  photo.date_time_original = current - Rational(i, 24 * 60 * 60) # i秒前
  photo.save
end
