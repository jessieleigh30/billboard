class Song < ApplicationRecord
  belongs_to :chart, optional: true
  belongs_to :artist
end
