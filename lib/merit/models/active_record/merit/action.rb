module Merit
  class Action < ActiveRecord::Base
    self.table_name = :merit_actions

    has_many :activity_logs, class_name: 'Merit::ActivityLog'

    if show_attr_accessible?
      attr_accessible :user_id, :action_method, :action_value, :had_errors,
                      :target_model, :target_id, :processed, :log
    end

    before_save :default_value


	  def default_value
	    self.processed ||= false
	    true
	  end
  end
end
