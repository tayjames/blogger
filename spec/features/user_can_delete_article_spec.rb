require "rails_helper"

describe "A user can delete a specific article" do
  describe "A user can click a delete button" do
    it "deletes an article" do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      article_2 = Article.create!(title: "Title 2", body: "Body 2")

      visit articles_path
      expect(page).to have_content("Title 1")

      click_on("Title 1")
      save_and_open_page
      expect(page).to have_link("Delete")
      click_on("Delete")

      expect(current_path).to eq(articles_path)
      expect(page).to_not have_content("Title 1")
      expect(page).to_not have_content("Body 1")
      expect(page).to have_content("Title 2")
      expect(page).to have_content("Body 2")
    end
  end
end
