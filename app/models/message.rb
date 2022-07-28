class Message < ApplicationRecord
  belongs_to :room

  # broadcasts_to ->(room) { "rooms" }, inserts_by: :prepend
  # Check https://www.rubydoc.info/gems/turbo-rails/0.5.2/Turbo/Broadcastable
  # for more syntactic sugar of turbo stream
  after_create_commit -> { broadcast_prepend_to room, locals: { message: self, room: room } }
  after_destroy_commit -> { broadcast_remove_to room, locals: { message: self, room: room } }
  after_update_commit -> { broadcast_update_to room, locals: { message: self, room: room } }
end
