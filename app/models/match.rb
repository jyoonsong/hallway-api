class Match < ApplicationRecord
  belongs_to :match_one, foreign_key: "match_one_id", class_name: "User"
  belongs_to :match_two, foreign_key: "match_two_id", class_name: "User"
end
