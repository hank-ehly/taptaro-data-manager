server ENV['SAKURAIP'],
       user: ENV['SAKURAUSER'],
       roles: %w{web app},
       ssh_options: {
               # user: 'user_name', # overrides user setting above
               keys: %w(/Users/henryehly/.ssh/sakura/id_rsa_sakura),
               # forward_agent: false,
               auth_methods: %w(publickey)
               # password: ENV['SAKURAPASSWORD']
       }