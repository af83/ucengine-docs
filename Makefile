doc:	
	gollum-site generate
	cd _site && ln -s Home.html index.html
	rm _site/Makefile

clean:
	rm -rf _site
