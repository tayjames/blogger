require 'rails_helper'

describe "As a user I can visit a particular articles show page" do
  describe "visit /articles/:id" do
    it "displays one article" do
      article_1 = Article.create!(title: "Title 1", body: "Body 1")
      comment_1 = article_1.comments.create!(author_name: "Me", body: "Comment")
      comment_2 = article_1.comments.create!(author_name: "You", body: "Comment")

      visit articles_path
      click_link article_1.title

      expect(current_path).to eq(article_path(article_1.id))
      expect(page).to have_content(article_1.title)
      expect(page).to have_content(article_1.body)

      expect(page).to have_content(comment_1.author_name)
      expect(page).to have_content(comment_1.body)

      expect(page).to have_content(comment_2.author_name)
      expect(page).to have_content(comment_2.body)
    end
  end

  describe "they fill in a comment form" do
    it "displays the comment on the article show page" do
      article = Article.create!(title: "New Title", body: "New Body")

      visit article_path(article)

      fill_in "comment[author_name]", with: "MEMEME!"
      fill_in "comment[body]", with: "These are my thoughts on this article."
      click_on "Submit"

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content("Post a Comment")
      expect(page).to have_content("MEMEME!")
      expect(page).to have_content("These are my thoughts on this article.")
      expect(page).to have_content(article.comments.count)
      save_and_open_page
    end
  end
end
