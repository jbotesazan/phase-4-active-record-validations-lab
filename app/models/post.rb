class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}

    validate :clickbaity

    # def clickbaity
    #     matching = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]
    #     post = self.title
    #     matching.each do |s|
    #         byebug
    #         unless post.match(s)
    #             errors.add(:title, 'Sorry, we are afraid your title is not clickbaity enough.')
    #         end
    #     end
    # end

    def clickbaity
        matching = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]
            unless matching.any? {|s| s.match(title)}
            errors.add(:title, 'Sorry, we are afraid your title is not clickbaity enough.')
        end
    end

end
