Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:hash.:extension'
Paperclip::Attachment.default_options[:has_secret] = "longSecretString"