FactoryGirl.define do
<<<<<<< Updated upstream
  factory :user do
    username  "ravi2020"
    firstname  "ravi"
    lastname  "sharma"
    sex  "male"
    age "22"
    email "abc@gmail.com"
  end
=======
	factory :user, class: User do
		email 'a@b.com'
		password 'password'
		username 'username'
		firstname 'firstname'
		lastname 'lastname'
		boy true		
	end
>>>>>>> Stashed changes
end