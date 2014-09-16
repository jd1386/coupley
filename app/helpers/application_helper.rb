module ApplicationHelper

 	def gravatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "http://gravatar.com/avatar/#{gravatar_id}.png"
  end

  
  def url_with_protocol(url)
    /^http/i.match(url) ? url : "http://#{url}"
  end


end
