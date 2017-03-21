class Blog < ActiveRecord::Base
	include Bootsy::Container
	scope	:is_published, -> { where(published: true) }
end
