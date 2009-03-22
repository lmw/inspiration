class Image < ActiveRecord::Base
  def self.new_keys_on_s3
    all_keys = S3Image.all_keys
    existing = Image.all :conditions => {:key => all_keys}
    all_keys = all_keys.to_set
    new_keys = all_keys.subtract(existing.collect{ |i| i.key })
  end

  def self.create_for_new_on_s3
    new_keys_on_s3.collect do |key|
      Image.create(:key => key)
    end
  end
  
  def url
    S3Image.url_for(key)
  end
end

class S3Image < AWS::S3::S3Object
  BUCKET = 'static.lauramwebster.com'
  PREFIX = 'inspiration/'
  set_current_bucket_to BUCKET

  def self.all_keys
    AWS::S3::Bucket.objects(BUCKET, :prefix => PREFIX).collect{ |o| o.key }
  end

  def url_for(*args)
    key = args.shift
    super(key, BUCKET, *args)
  end
end
