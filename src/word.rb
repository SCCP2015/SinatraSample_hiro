require 'data_mapper'

# Model Class
class Word
  include DataMapper::Resource

  property :id, Serial
  property :msg, String
  property :user, String

end

DataMapper.finalize
