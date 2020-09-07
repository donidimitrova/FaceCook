require 'rails_helper'
RSpec.describe 'Inserisci descrizione', type: :feature do
  before do
  User.delete_all
  m1 = User.new( :id=>'1',:username=> 'username',:name=>'name',:cognome=>'cognome',:email => 'email@gmail.com', :password => '12345678', :password_confirmation=>'12345678', :categoria=>'1')
  m1.save!
  end
  scenario 'Inserisci descrizione' do
    visit new_user_session_path
    fill_in 'user_email', with: 'd@gmail.com'
    fill_in 'user_password', with: '12345678'
    click_on 'Entra'
    expect(page).to have_content('Login')
    fill_in 'user_email', with: 'email@gmail.com'
    fill_in 'user_password', with: '12345678'
    click_on 'Entra'
    expect(page).to have_content('Logout')
    click_on 'Profilo'
    fill_in 'user_descrizione', with: 'ciao'
    click_on 'Aggiorna descrizione'
    expect(page).to have_content('ciao')
    fill_in 'user_descrizione', with: 'ciao a tutti'
    click_on 'Aggiorna descrizione'
    expect(page).to have_content('ciao a tutti')
    fill_in 'user_descrizione', with: ''
    click_on 'Aggiorna descrizione'
    expect(page).to have_content('')
    fill_in 'user_descrizione', with: 'Ho modificato la mia descrizione'
    click_on 'Aggiorna descrizione'
    expect(page).to have_content('Ho modificato la mia descrizione')
  end
end