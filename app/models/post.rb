class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :clickbait?

    CLICKBAIT_PATTERNS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
    ]
    
    def clickbait?
        if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
          errors.add(:title, "must be clickbait")
        end
    end
end
#     All authors have a name
# No two authors have the same name
# Author phone numbers are exactly ten digits
# All posts have a title
# Post content is at least 250 characters long
# Post summary is a maximum of 250 characters
# Post category is either Fiction or Non-Fiction. This step requires an inclusion validator, which was not outlined in the lesson. You'll need to refer to the Rails guideLinks to an external site. to look up how to use it.

# Finally, add a custom validator to the Post model that ensures the title is sufficiently clickbait-y. The validator should add a validation error if the title does not contain:

# "Won't Believe"
# "Secret"
# "Top [number]"
# "Guess"