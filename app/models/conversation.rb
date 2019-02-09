class Conversation < ApplicationRecord
  has_many :private_messages
  belongs_to :participant1, class_name: "User"
  belongs_to :participant2, class_name: "User"

  def participants
    [self.participant1, self.participant2]
  end

  def last_message
    self.private_messages.last
  end

  def already_exist?
    conversations = Conversation.all
    conversations.each do |c|
      if self.participants == c.participants || self.participants == c.participants.reverse
        return [true, c.id]
      end
    end
    return false
  end
end
