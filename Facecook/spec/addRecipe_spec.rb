require 'rails_helper'
RSpec.describe 'Inserisci ricetta', type: :feature do
  before do
  User.delete_all
  m1 = User.new( :id=>'1',:username=> 'username',:name=>'name',:cognome=>'cognome',:email => 'email@gmail.com', :password => '12345678', :password_confirmation=>'12345678', :categoria=>'1')
  m1.save!
  end
  scenario 'Inserisci ricetta' do
    visit new_user_session_path
    fill_in 'user_email', with: 'email@gmail.com'
    fill_in 'user_password', with: '12345678'
    click_on 'Entra'
    expect(page).to have_content('Logout')
    click_on 'Inserisci ricetta'
    expect(page).to have_content('Torna alla home')
    fill_in 'recipe_nome', with: 'pasta al sugo'
    fill_in 'recipe_link', with: 'pomodoro'
    fill_in 'recipe_descrizione', with: 'buona'
    path='features/11.jpg'
    attach_file 'recipe_immagine',path
    click_on 'Salva'
    expect(page).to have_content('La ricetta è stata inserita!') 
  end
end
