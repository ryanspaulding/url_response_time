# URL Response Time
This is a Munin plugin that measures the response time of a URL. The default is www.linkedin.com, but you can set it to whatever URL you need to monitor in your organization.  

### On the command line

./url_response_time.rb  
url_response_time.value 0.49


### Installing

Just place the file under /etc/munin/plugins/ and it should get picked up in the next run (default is every five minutes)

$ munin-run url_response_time.rb  
url_response_time.value 0.49  
$ munin-run url_response_time.rb config  
graph_title URL Response Time 
graph_vlabel time  
graph_info This graph shows the response time of http://www.linkedin.com/  
graph_args --base 1000 -l 0  
graph_scale no  
url_response_time.warning 60  
url_response_time.critical 120  
url_response_time.label time  

### Issues?
Feel free to send me pull requests or email me :)
