FactoryGirl.define do
	factory :user, class: User do
		email 'a@b.com'
		password 'password'
		username 'username'
		firstname 'firstname'
		lastname 'lastname'
		boy true		
		date_of_birth '12/12/12'
	end
end