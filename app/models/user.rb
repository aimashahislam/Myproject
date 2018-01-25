class User < ApplicationRecord
	validates :name, presence: true
	after_destroy :stopExecution
	after_save :test_transaction

	private
		def test_transaction
			transaction do
				raise
			end	
		end

		def stopExecution
			# errors.add(:base, "can't be destroyed cause i dont want it to -_-")
			User.create self
		end
end
