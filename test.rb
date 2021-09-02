ap "je sui sla"

# params_ids = [94430, 9441]

messages = Message.last(3)

ap messages.map(&:snippet)


google_message_ids = messages.map(&:google_id)

# ap google_ids =  Message.where(id: params_ids).pluck(:google_id)

BatchDeleteGoogleMessages.new(User.last, google_message_ids).call
