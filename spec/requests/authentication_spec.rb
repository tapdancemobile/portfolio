require 'spec_helper'

describe "Authentication" do

    subject { page }

    describe "Signup page" do
        before { visit new_user_registration_path }

        let(:submit) { "Sign up" }

        describe "with invalid information" do
          it "should not create a user" do
            expect { click_button submit }.not_to change(User, :count)
          end

          describe "after submission" do
            before { click_button submit }

            it { should have_content('Sign up') }
            it { should have_content('error') }
          end
        end

        describe "with valid information" do
          before do
            fill_in "Email",        			 with: "user@example.com"
            fill_in "Password",     			 with: "foobar1234"
            fill_in "Password confirmation",     with: "foobar1234"
          end

          it "should create a user" do
            expect { click_button submit }.to change(User, :count).by(1)
          end
        end

        it { should have_content('Sign up') }
    end


    describe "Signin page" do 

        before { visit new_user_session_path }

        describe "with invalid information" do
            before { click_button "Sign in" }

            it { should have_content('Sign in') }
            it { should have_content("Invalid email or password.") }

        end

        describe "with valid information" do
            let(:user) { FactoryGirl.create(:user) }
            before do 
                fill_in "Email",    with: user.email
                fill_in "Password", with: user.password
                click_button "Sign in"
            end

            it { should_not have_selector('a', text: 'Sign up')}
            it { should_not have_selector('a', text: 'Sign in')}
            it { should have_selector('a', text: 'Edit profile') }
            it { should have_selector('a', text: 'Logout') }
            it { should have_content('Signed in successfully.') }

        end

        it { should have_content('Sign in') }
    end
end