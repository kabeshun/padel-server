class User < ApplicationRecord
  extend Enumerize
  enumerize :gender, in: %i[
    male
    female
    other
  ]
end