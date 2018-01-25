class Author < ApplicationRecord
	validates :name ,presence: true, length: { minimum: 3 }
	validates_with AuthorValidator
	has_many :books ,dependent: :destroy
	accepts_nested_attributes_for :books
	#, reject_if: proc { |attributes| attributes[:title].blank? }
end
