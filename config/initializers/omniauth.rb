Rails.application.config.middleware.use OmniAuth::Builder do

  # ==> Twitter
 provider :twitter, 'nLpcUc7W1Meknqy8ZCHBZw', 'wP0XAGiNypExc4ObpyCTOmP9rLFZyRT6U3FxyzRydA'

  # ==> Facebook
 provider :facebook, '124983381024311', 'e57a6104170398577ca286e257fdef74'

  # ==> GitHub
 provider :github, '11c75b100e99f0118ef4', '7fa145f31d689318596411b775457427b99cdb32'

  # ==> LinkedIn
 provider :linked_in, 'n9df58a1hsud', 'EiTKeQysAcA1sGLF'


end