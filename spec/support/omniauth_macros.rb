module OmniauthMacros
  def mock_auth_hash
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
                                                                    provider: 'github',
                                                                    uid:'123545',
                                                                    info: {
                                                                        nickname: 'TestUser',
                                                                        name: 'Vasya Pupkin',
                                                                        first_name: 'Vasya',
                                                                        last_name: 'Pupkin',
                                                                        email: 'test@email.com'
                                                                    },
                                                                    credentials: {
                                                                        token: 'mock_token',
                                                                        secret: 'mock_secret'
                                                                    }

                                                                })
  end
end