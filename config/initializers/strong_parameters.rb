# Set up every ActiveModel with Strong Paramters
ActiveRecord::Base.send(:include, ActiveModel::ForbiddenAttributesProtection)