namespace :gold  do
  desc '获取黄金价格'
  task :price => :environment do
    puts "start"
    start_time = Time.now
    require 'net/http'
    price_api = "http://wap.ccb.com/mbs_web/invest_metal_marketTrendInfo.do?imgCode=019999&bondType=2&days=2016-06-22"
    current_day = Time.now.strftime("%Y-%m-%d")
    price_api = price_api.gsub("2016-06-22",current_day)
    uri = URI(price_api)
    price_data = Net::HTTP.get(uri)
    price_data = price_data.gsub("\n","")
    price_data = eval(price_data)
    price_data = price_data[:response][:fieldList]
    price_dir = Rails.root.join("public","gold")
    FileUtils.mkdir_p(price_dir) unless File.exist?(price_dir)
    price_path = price_dir.to_s + "/" +  current_day

    price_data.each do |price|
      Gold.create!(date:price[:date],time:price[:time],price:price[:adjClose])
    end
    puts price_data.size
    end_time = Time.now
    data = price_data.to_s +  "\n\n\n" + "start_time: " + start_time.to_s + "\n" + "end_time:   " + end_time.to_s
    File.open(price_path,"w+") do |file|
      file.write(data)
    end
    puts "end"
  end
end