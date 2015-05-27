# coding: utf-8
require 'singleton'

# Databaselike System
class Database
  include Singleton

  FILE = 'data'

  def read
    if File.exist?(FILE)
      File.read(FILE)
    else
      ''
    end
  end

  def over(word)
    if File.exist?(FILE)
      data = File.read(FILE)
      File.write(FILE, data + word + "\n")
      data + word
    else
      File.write(FILE, word + "\n")
      word
    end
  end

  def add(word)
    File.write(FILE, word + "\n")
    word
  end

  def delete
    File.write(FILE, '')
    ''
  end
end
