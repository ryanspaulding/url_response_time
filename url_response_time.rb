#!/usr/bin/env ruby

#       url_response_time.rb      
#       
#		This is a Munin plugin that measures the response time of a URL. 
#		The default is www.linkedin.com, but you can set it to whatever URL 
#		you need to monitor in your organization.
#       
#		./url_response_time.rb	
#
#       Author: ryanspaulding@gmail.com
###############################

require 'net/http'
require 'uri'

URL_TO_MONITOR = "http://www.linkedin.com/"

# handle displaying the config
if ARGV.length == 1 and ARGV[0] == "config"
		puts "graph_title URL Response Time"
		puts "graph_vlabel time"
		puts "graph_info This graph shows the response time of %s" % URL_TO_MONITOR
		puts "graph_args --base 1000 -l 0"
		puts "graph_scale no"
		puts "url_response_time.warning 60"
		puts "url_response_time.critical 120"
		puts "url_response_time.label time"
        exit(0)
end


url = URI.parse(URL_TO_MONITOR)
req = Net::HTTP::Get.new(url.path)
@start_time = Time.new 
res = Net::HTTP.start(url.host, url.port) { |http|
	http.request(req)
}
@end_time = Time.new

@response_time = @end_time - @start_time

puts "url_response_time.value %.2f" % @response_time

