Tag.create(:tag => "test")
pwd="test"
User.create(email: "stanleychris2@gmail.com", username: "chris",
			password: pwd, password_confirmation: pwd, about: "hello my name is chris",
			is_admin: true )