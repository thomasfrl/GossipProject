module ApplicationHelper
  def get_random_image
    image_path_prefix = "app/assets/images/"
    image_files = Dir.glob("#{image_path_prefix}gossips_index/*")
    image_files.sample.split(image_path_prefix)[1]
  end
  def participant(conversation)
    if conversation.participant1 == current_user
      return conversation.participant2
    else
      return conversation.participant1
    end    
  end

end
