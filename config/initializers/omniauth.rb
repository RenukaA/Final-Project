Rails.application.config.middleware.use OmniAuth::Builder do
  provider :linkedin, "77zhrwvycojuor", "2LtL8yw1DOaTjmJE", :scope => 'r_fullprofile r_emailaddress r_network'
end