# Resque Web GUI
##(With Resque Cleaner & Resque Sliders)

Need a GUI to monitor your Redis / Resque queues but freak out when you read the instructions for setting up resque-web? why do you need a framework? and a ruby env? and all these gem's etc etc etc? - especially if you haven't even looked at Ruby in your life or are using a different platform (php-resque for example).

This will sort you out - in 1 command you can point this at your Redis server and have a GUI that will allow you to monitor, manage and most importantly (the reason I started this) the ability to requeue failed jobs easily!

## Getting the container
Obviously you need to have docker installed:

	sudo apt-get install docker.io
	
To download the container run (as root or sudo)

	docker pull voycey/resque-web

Or clone this into a directory and issue (as root or sudo)

	docker build -t resque-web resque-web

## Usage

Run the container with the same options you use for resque-web. The options -F (run in foreground) and -L (do not launch browser) are included by default.

If no options are provided, the help screen for resque-web will be displayed.

Included in this is the resque-cleaner gem also which helps you restart failed jobs. This will appear as a tab in the resque-web interface

To run it as a one off:

    docker run --rm -p 5678:5678 voycey/resque-web -r redis://your-ip-here:6379 /resque-web.rb

To run as a background service:

    docker run -d --restart=always --name resque-web -p 5678:5678 voycey/resque-web -r redis://your-ip-here:6379 /resque-web.rb
    
    
Then it can be accessed by going to ```http://your-server-ip:5678```

##Gotchas

If you aren't familiar with Docker then there a couple of Gotchas you need ot be aware of, for example you couldn't do this:

    docker run --rm -p 5678:5678 voycey/resque-web -r redis://127.0.0.1:6379 /resque-web.rb
    
To connect to a redis server on the same machine. Docker runs as its own containerised process, meaning that 127.0.0.1 is actually referring to the local IP of the docker container.

What you will need to do if you want to install this on the same machine as your redis server is point it towards the IP that Docker assigns to itself when you install it (I think it is usually the same on all installs but double check using ifconfig)

##For example:

	[LIVE- root@myserver /mnt/www/docker]# ifconfig
	docker0   Link encap:Ethernet  HWaddr 56:84:7a:fe:97:99  
          inet addr:172.17.42.1  Bcast:0.0.0.0  Mask:255.255.0.0
          inet6 addr: fe80::5484:7aff:fefe:9799/64 Scope:Link
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:674 errors:0 dropped:0 overruns:0 frame:0
          TX packets:703 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:967601 (967.6 KB)  TX bytes:75798 (75.7 KB)

So in this case to connect to the Redis instance on your local machine you would do:

	docker run --rm -p 5678:5678 voycey/resque-web -r redis://172.17.42.1:6379 /resque-web.rb
