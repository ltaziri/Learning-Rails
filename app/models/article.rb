class Article < ActiveRecord::Base

    # Define relationship with comments table, destroy comments related to article
    # when article is destroyed in the database. 
    has_many :comments, dependent: :destroy

    # Validate that title is present and at least 5 characters before attempting
    # to save to the database. 
    validates :title, presence: true,
                    length: { minimum: 5 }
end
