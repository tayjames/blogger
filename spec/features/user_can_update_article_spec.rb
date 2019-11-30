require "rails_helper"

describe "A user can update/edit a specific article" do
  describe "A user can click an edit button" do
    it "updates an article" do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")

      visit articles_path
      click_on("Title 1")

      expect(page).to have_link("Edit")
      click_on("Edit")

      expect(current_path).to eq("/articles/#{article_1.id}/edit")
      fill_in "Title", with: "Updated Title"
      fill_in "Body", with: "Updated Body"

      expect(page).to have_button("Update Article")
      click_on("Update Article")

      expect(current_path).to eq(article_path(article_1.id))
      article_1.reload
      expect(page).to have_content("Updated Title")
      expect(page).to have_content("Updated Body")
      expect(page).to have_content("Article '#{article_1.title}' Updated!")
    end
  end
end
