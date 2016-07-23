require 'net/http'
price_api = "http://wap.ccb.com/mbs_web/invest_metal_marketTrendInfo.do?imgCode=019999&bondType=2&days=2016-06-22"
current_day = Time.now.strftime("%Y-%m-%d")
price_api = price_api.gsub("2016-06-22",current_day)
uri = URI(price_api)
price_data = Net::HTTP.get(uri)
price_data = price_data.gsub("\n","")
price_data = eval(price_data)
price_data = price_data[:response][:fieldList]
price_data.each do |price|
  Gold.create!(date:price[:date],time:price[:time],price:price[:adjClose])
end

