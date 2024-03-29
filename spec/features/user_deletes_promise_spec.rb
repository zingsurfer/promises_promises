require 'rails_helper'

feature 'User can delete a promise' do
  context 'As a user on "/promises"' do
    context 'I click on delete' do
      it 'deletes the promise' do
        promise = Promise.create(content: "Smash things",
                                   maker_name: "Bowser")
        visit promises_path

        click_on "Delete Promise"
        expect(current_path).to eq(promises_path)
        expect(page).to_not have_content(promise.content)
        expect(page).to_not have_content(promise.maker_name)
      end
    end
  end
end
