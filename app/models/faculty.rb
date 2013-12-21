class Faculty < ActiveRecord::Base
  has_many :courses
  validates :title, :description, :presence => true
  
  def self.get_key_values
    key_values = Hash.new
    self.all.map{|faculty| key_values[faculty.title] = faculty.id}
    key_values
  end
end
