# Comment.destroy_all
# Articles.destroy_all
Account.destroy_all

yel = Account.create(
  username: "gamalielhere",
  email:    "yel@example.com",
  password:              "abc123",
  password_confirmation: "abc123"
)

fil = Account.create(
  username: "philhere",
  email:    "phil@example.com",
  password:              "abc123",
  password_confirmation: "abc123"
)

a1 = yel.articles.create(
  title:       "Pokemon Rules!",
  description: "I really love Pokemon. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam nesciunt laudantium asperiores pariatur et voluptatibus id excepturi ad in sapiente, laborum, quaerat, quas est. Itaque similique inventore, atque quisquam cumque!"
)

a2 = yel.articles.create(
  title:       "Yu-gi-oh sucks!",
  description: "I really hate Yugioh. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam nesciunt laudantium asperiores pariatur et voluptatibus id excepturi ad in sapiente, laborum, quaerat, quas est. Itaque similique inventore, atque quisquam cumque!"
)

a3 = fil.articles.create(
  title:       "WDI: Pro or Con?",
  description: "You tell me! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsam nesciunt laudantium asperiores pariatur et voluptatibus id excepturi ad in sapiente, laborum, quaerat, quas est. Itaque similique inventore, atque quisquam cumque!"
)

Comment.create(
  content: "Look at you! Pikachu!",
  account: fil,
  article: a1
)

Comment.create(
  content: "I'm on the fence!",
  account: yel,
  article: a3
)
