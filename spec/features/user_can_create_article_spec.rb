require 'rails_helper'

describe "user creates a new article" do
  describe "They link from the articles index" do
    describe "they fill in a title and a body" do
      it "creates a new article" do
        visit articles_path

        expect(page).to have_link("Create a new Article")
        click_on("Create a new Article")

        expect(current_path).to eq(new_article_path)
        fill_in "Title", with: "New Title!"
        fill_in "Body", with: "New Body!"
        click_on "Create Article"
        # save_and_open_page
        # expect(current_path).to eq()
        expect(page).to have_content("New Title!")
        expect(page).to have_content("New Body!")
      end
    end
  end
end
