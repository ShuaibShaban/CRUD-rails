class User < ApplicationRecord
    has_secure_password 
end
# create a getter method for a property known as password, also creates a setter method
# retrieving password and convertimg it 