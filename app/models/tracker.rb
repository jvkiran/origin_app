class Tracker < ApplicationRecord
    validates_presence_of :name, :mobile, :message
end
