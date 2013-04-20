Rails.application.config.middleware.use OmniAuth::Builder do

  # ==> Twitter
 provider :twitter, 'yGYlXY7XVywwqGZS8hKMRg', 'XRsmr6UwDJr0Dfr82jdukBSTAFgGwF8r4b6dPUx5pq8'

  # ==> Facebook
 provider :facebook, '143341512513758', 'f966cbdee6509c62d7c9b9b6cb3e0caa'

  # ==> GitHub
 provider :github, '11c75b100e99f0118ef4', '7fa145f31d689318596411b775457427b99cdb32'

  # ==> LinkedIn
 provider :linked_in, '989bm69evo4m', 'mOotnZRXsskFcvKY'


end