class Suricate < Sinatra::Base
  helpers Sinatra::Param

  helpers do
    def ip_regexp
      block = /\d{,2}|1\d{2}|2[0-4]\d|25[0-5]/
      /\A#{block}\.#{block}\.#{block}\.#{block}\z/
    end
  end

  get '/lookup' do
    param :ip, String, required: true, format: ip_regexp
    param :language, String, in: %w(en ru), default: 'ru'

    ret = nil

    begin
      ret = self.class.db.lookup(params[:ip])
    rescue IPAddr::InvalidAddressError => ex
      content_type 'application/json; charset=utf-8'
      halt 400, JSON.dump(error: ex)
    end

    halt 404 unless ret.found?

    result = {
      country: ret.country.name(params[:language]),
      country_iso_code: ret.country.iso_code,
      city: ret.city.name(params[:language]),
      lat: ret.location.latitude,
      long: ret.location.longitude,
    }
    content_type 'application/json; charset=utf-8'
    halt 200, JSON.dump(result)
  end

  get '/health' do
    content_type 'plain/text; charset=utf-8'
    if self.class.db.lookup('8.8.8.8').country.name.nil?
      halt 400, 'Something wrong'
    else
      halt 200, 'OK'
    end
  end

  def self.root
    File.expand_path(File.join(File.dirname(__FILE__), %w(..)))
  end

  def self.db
    @db ||= MaxMindDB.new(File.join(root, %w(maxminddb GeoLite2-City.mmdb)))
  end
end
