class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}

    validate :must_include_in_title

    def must_include_in_title

        allowed_titles = [/Won't Believe/i, /Secret/i, /Top \d/i, /Guess/i]

        if allowed_titles.none? { |title_string| title_string.match?(title) }
            errors.add(:title, "Your title must include 'Won't Believe', 'Secret', 'Top [number]', or 'Guess'. 💩" )
        end

        # allowed_titles.each do |title_string|
        #     if title_string.match?(title)
        #     else
        #         errors.add(:title, "Your title must include 'Won't Believe', 'Secret', 'Top [number]', or 'Guess'. 💩" )
        #     end
        # end

        # if title.match?(/Won't Believe/)
        # else
        #     errors.add(:title, "Your title must include 'Won't Believe', 'Secret', 'Top [number]', or 'Guess'. 💩" )
        # end
    end

end
