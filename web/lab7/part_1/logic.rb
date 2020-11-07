# frozen_string_literal: true

def generate_file(name, len = 15)
  chars = ('a'..'z').to_a
  random_text = (0..len).collect { chars.sample }.join ''
  File.open(name, 'w') { |f| f.puts(random_text) }
end

def new_text_from_file_into_file(from, into)
  str = File.open(from, 'r').gets.scan(/a\w/).join('').split('').delete_if { |i| i == 'a' }.join('')
  File.open(into, 'w') { |f| f.puts(str) }
end
