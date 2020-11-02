require 'pry'
class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    validate :clickbait_title
    

    def clickbait_title
        words = ["Won't Believe", "Secret", "Top [number]", "Guess"]
        # binding.pry
        if title && !words.any? { |s| title.include? s}
            errors.add(:title, "Needs to be clickbait")
        end
    end

end
