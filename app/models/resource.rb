class Resource < ActiveRecord::Base
  has_many :reviews, :dependent => :destroy
  belongs_to :topic, :counter_cache => true
  belongs_to :contributor, :class_name => 'User'
  
  validates :name, :presence => true
  validates :url, :presence => true # TODO this won't always be the case
  before_validation :validate_url_and_fetch_title
  
  def to_s
    self.name
  end
  
  def update_average_rating!
    self.average_rating = self.reviews.average :rating
    self.save!
  end
  
  def site
    # TODO make new model for Site
    URI.parse(self.url).host || self.url
  end
  
  
  private

  def validate_url_and_fetch_title
    begin
      end_response = RestClient.get(self.url) { |response, request, result, &block|
        case response.code
        when 301, 302, 307
          # it's a redirect, so update the URL
          self.url = response.headers[:location]
          response.follow_redirection(request, result, &block)
        else
          response.return!(request, result, &block)
        end
      }
    rescue
      errors.add(:url, 'is invalid')
    end
    
    if end_response and self.name.blank?
      doc = Nokogiri::HTML(end_response)
      title = doc.xpath('//head/title[1]').first.text rescue nil
      self.name = title
    end
  end
end
