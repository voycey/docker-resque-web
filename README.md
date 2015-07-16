# Resque Web in Docker 
##(With Resque Cleaner)

## Getting the container

To download the container run

    docker pull voycey/resque-web

Or clone this into a directory and issue

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
	Replace debian/jessie base with Phusion Baseimage
	Find some more nice stuff to extend resque-web with
