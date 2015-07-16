# Resque Web in Docker 
##(With Resque Cleaner & Resque Sliders)

Need a GUI to monitor your Redis installation but freak out when you read the instructions for setting up resque-web, why do you need a framework and a ruby env and all these gem's etc etc etc - especially if you haven't even looked at Ruby in your life?

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

#TODO:
	Find some more nice stuff to extend resque-web with
