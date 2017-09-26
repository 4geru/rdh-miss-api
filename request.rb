require 'net/http'
require 'json'
require 'dotenv'
require 'uri'
Dotenv.load ".env"

def proofreading(word)
    # リクエストに転送するパラメーターの設定
    param = {
        :apikey => ENV['TYPO_API'],
        :sentence => word,
    }
    
    # リクエストの送信
    
    begin 
        uri = URI('https://api.a3rt.recruit-tech.co.jp/proofreading/v1/typo')
        
        uri.query = URI.encode_www_form(param)
        res = Net::HTTP.get_response(uri)
        result = JSON.parse(res.body)
        if res.is_a?(Net::HTTPSuccess) and not result[:status].nil?
          return result['alerts'][0]['checkedSentence'].gsub('<<',"`").gsub('>>',"`")
        elsif res.is_a?(Net::HTTPSuccess)
          return   word
        else
          return 'error' 
        end
    rescue => e
      return e
    end
end