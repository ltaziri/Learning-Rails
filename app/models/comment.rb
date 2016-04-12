class Comment < ActiveRecord::Base

    # Define relationship to article table in database.
    belongs_to :article
    
end
