domains = ["github.com",
        "accounts.google.com",
        "linkedin.com",
        "itr.mail.codecademy"]


domains.each do |domain|
  emails = Message.where("messages.from ILIKE ?", "%#{domain}%")


  nb = emails.count

  nb_to_delete = (nb / 2) - rand(3)

  nb_to_delete = 0 if nb_to_delete < 0


  emails.limit(nb_to_delete).destroy_all
end
