require 'rails_helper'

describe "As a user I can visit a particular articles show page" do
  describe "visit /articles/:id" do
    it "displays one article" do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")

      # visit "/articles/#{article_1.id}"
      visit articles_path
      click_link article_1.title

      expect(current_path).to eq(article_path(article_1.id))
      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)
    end
  end
end
