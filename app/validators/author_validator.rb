class AuthorValidator < ActiveModel::Validator
  def validate(record)
  	if record.name =~ /\A[[:lower:]]/
  		record.errors.add(record.name, ' must start with upper case')
  	end
  end
end