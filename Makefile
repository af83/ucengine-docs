doc:	
	gollum-site generate
	ronn --style toc --pipe -5 ucectl.md > _site/ucectl.html

	cd _site && ln -s Home.html index.html
	rm _site/Makefile

clean:
	rm -rf _site
