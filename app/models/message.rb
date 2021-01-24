class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat
  validates :content, presence: true
  def template
    ApplicationController.renderer.render partial: 'messages/message', locals: { message: self }
  end
end
