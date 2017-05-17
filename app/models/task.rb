class Task < ApplicationRecord
  validates :content, presence: true, length: {minimum: 5, maximum: 255}
  belongs_to :user
  
  auto_html_for :content do
    html_escape
    image
    youtube(width: '100%', height: 250)
    link target: '_blank', rel: 'nofollow'
    simple_format
  end
end