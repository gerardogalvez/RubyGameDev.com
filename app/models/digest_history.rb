class DigestHistory < ActiveRecord::Base

  def self.create_new!(frequency)
    history = new(frequency: frequency)
    history.last_discussion_id = Discussion.last.id  rescue 0
    history.last_tutorial_id = Tutorial.last.id  rescue 0
    history.last_library_id = Library.last.id rescue 0
    history.users_count = User.count
    history.save!
    history
  end

  def discussions
    Discussion.where('id > ?', last_discussion_id).all
  end

  def tutorials
    Tutorial.where('id > ?', last_tutorial_id).all
  end

  def libraries
    Library.where('id > ?', last_library_id).all
  end

end
