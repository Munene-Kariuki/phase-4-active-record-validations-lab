class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  validate :clickbait?

  TITLE_NOT_CONTAIN = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
  ]

  def clickbait?
    if TITLE_NOT_CONTAIN.none? { |word| word.match title }
      errors.add(:title, "must be clickbait")
    end
  end

end
