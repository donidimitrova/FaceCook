require 'rails_helper'


RSpec.describe Recipe, :type => :model do
    User.delete_all
    Recipe.delete_all
   describe "Create recipe " do
        it "should be permitted" do
            m1 = User.new( :id=>'1',:username=> 'username',:name=>'name',:cognome=>'cognome',:email => 'email@gmail.com', :password => '12345678', :password_confirmation=>'12345678',:categoria=>'1')
            m1.save!
            categoria=Category.new(:id=>'1',:name=>'Colazione')
            categoria.save!
            recipe = Recipe.new(:user_id=>m1.id,:nome => 'pasta al sugo',:immagine_file_name =>"features/11.jpg", :descrizione=>"buona",:link=>"pomodoro",:category_id=>'1')
            expect(recipe).to be_valid
        end
    end

    describe "Create recipe without a name" do
        it "shouldn't be permitted" do
            m1 = User.new( :id=>'1',:username=> 'username',:name=>'name',:cognome=>'cognome',:email => 'email@gmail.com', :password => '12345678', :password_confirmation=>'12345678',:categoria=>'1')
            m1.save!
            categoria=Category.new(:id=>'1',:name=>'Colazione')
            categoria.save!
            recipe = Recipe.new(:user_id=>m1.id,:immagine_file_name =>"features/11.jpg", :descrizione=>"buona",:link=>"pomodoro",:category_id=>'1')
          expect(recipe).not_to be_valid
        end
    end

    describe "Create recipe without image" do
        it "shouldn't be permitted" do
            m1 = User.new( :id=>'1',:username=> 'username',:name=>'name',:cognome=>'cognome',:email => 'email@gmail.com', :password => '12345678', :password_confirmation=>'12345678',:categoria=>'1')
            m1.save!
            categoria=Category.new(:id=>'1',:name=>'Colazione')
            categoria.save!     
            recipe = Recipe.new(:user_id=>m1.id,:nome => 'pasta al sugo', :descrizione=>"buona",:link=>"pomodoro",:category_id=>'1')
            expect(recipe).not_to be_valid
        end
    end
    describe "Create card without description" do
        it "shouldn't be permitted" do
            m1 = User.new( :id=>'1',:username=> 'username',:name=>'name',:cognome=>'cognome',:email => 'email@gmail.com', :password => '12345678', :password_confirmation=>'12345678',:categoria=>'1')
            m1.save!
            categoria=Category.new(:id=>'1',:name=>'Colazione')
            categoria.save!   
            recipe = Recipe.new(:user_id=>m1.id,:nome => 'pasta al sugo',:immagine_file_name =>"features/11.jpg",:link=>"pomodoro",:category_id=>'1')
            expect(recipe).not_to be_valid
        end
    end
    describe "Create card without a link " do
        it "shouldn't be permitted" do
            m1 = User.new( :id=>'1',:username=> 'username',:name=>'name',:cognome=>'cognome',:email => 'email@gmail.com', :password => '12345678', :password_confirmation=>'12345678',:categoria=>'1')
            m1.save!
            categoria=Category.new(:id=>'1',:name=>'Colazione')
            categoria.save!   
            recipe = Recipe.new(:user_id=>m1.id,:nome => 'pasta al sugo',:immagine_file_name =>"features/11.jpg", :descrizione=>"buona",:category_id=>'1')
            expect(recipe).not_to be_valid
        end
    end
end