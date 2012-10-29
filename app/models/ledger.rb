class Ledger < ActiveRecord::Base
  attr_accessible :cents, :user_id
  belongs_to :user
end
