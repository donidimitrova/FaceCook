require 'rails_helper'
RSpec.describe User, :type => :model do
    User.delete_all
    describe "Crea utente" do
        it "non valido senza password confirmation" do
            @user= User.new(:id => '1', :username=> "username", :name=>'bho',:cognome=>'bho9',:email => 'prova1@example.it', :password => '1555556', :categoria=>'2')
            expect(@user).to_not be_valid   
        end
        it "non valido senza username" do
            @user= User.new(:id => '1', :name=>'bho',:cognome=>'bho9',:email => 'prova1@example.it', :password => '123456', :password_confirmation=>'123456', :categoria=>'2')
            expect(@user).to_not be_valid
        end
        it "non valido senza name" do
            @user= User.new(:id => '1', :username=>'username',:cognome=>'cognome',:email => 'prova1@example.it', :password => '123456', :password_confirmation=>'123456', :categoria=>'2')
            expect(@user).to_not be_valid 
        end

        it "valido con tutti i campi " do
            @user = User.new(:id => '1', :username=>'username',:name => "manu", :cognome => "cognome", :email => "example@example.com", :password =>      "password", :password_confirmation=>"password", :categoria=>'2')
            expect(@user).to be_valid
        end
        it "non valido con email registrata" do
            @user1 = User.create!(:username=>'username',:name => "nome1", :cognome => "cognome1", :email => "example1@example.com", :password => "password", :password_confirmation => "password", :categoria=>'2')
            @user2 = User.new(:username=> 'username',:name => "nome2", :cognome => "cognome2", :email => "example1@example.com", :password => "password", :password_confirmation => "password",:categoria=>'2')
            expect(@user2).to_not be_valid
            @user1.destroy
        end
        it "non valido senza password" do
            @user = User.new(:name => "nome", :cognome => "cognome", :email => "example@example.com", :categoria=>'2')
            expect(@user).to_not be_valid

        end
        
    end
    describe 'Modifica' do
        it "non è valido con nome bianco" do
            @user = User.new(:username=>"username",:name => "nome", :cognome => "cognome1", :email => "example@example.com", :password => "password", :password_confirmation => "password", :categoria=>'1')
            expect(@user).to be_valid
            @user.name = ""
            expect(@user).to_not be_valid
  
        end

        it "non è valido con cognome bianco" do
            @user = User.new(:username=>"username",:name => "nome", :cognome => "cognome1", :email => "example@example.com", :password => "password", :password_confirmation => "password", :categoria=>'1')
            expect(@user).to be_valid
            @user.cognome = ""
            expect(@user).to_not be_valid
  
        end
    end


end
