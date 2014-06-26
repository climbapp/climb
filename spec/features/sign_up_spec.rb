feature 'Sign Up' do
    scenario 'Users can sign up' do
        visit root_path
        click_link 'Sign up'
        expect(current_path).to eq(new_user_path)
        fill_in :user_email, with: "email@email.com"
        fill_in :user_password, with: "pass"
        check :user_sms_remind
        fill_in :user_phone, with: "123-123-4567"
        click_button "Sign up"
        expect(page).to have_content("Hello Ruby")
        expect(current_path).to eq(root_path)
    end
end
