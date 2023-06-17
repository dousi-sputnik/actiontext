class Post < ApplicationRecord
  has_rich_text :content

  validates :title, presence: true , length: { maximum: 32 }

  validate :validate_content_length

  MAX_CONTENT_LENGTH = 100

  def validate_content_length
    length = content.to_plain_text.length

    if content.to_plain_text.length > MAX_CONTENT_LENGTH
      errors.add(
        :content, 
        :too_long, 
        max_content_length: MAX_CONTENT_LENGTH,
        length: length
      )
    end
  end
end
