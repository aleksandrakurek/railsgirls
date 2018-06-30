class Entry < ApplicationRecord

  validates :title, :contents, :date, presence: true
end
