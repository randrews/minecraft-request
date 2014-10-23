class Request < ActiveRecord::Base
    validates :reddit_username, presence: true, uniqueness: true
    validates :minecraft_username, presence: true, uniqueness: true

    def error_class field
        if errors && errors.messages[field]
            'has-error'
        else
            ''
        end
    end
end
