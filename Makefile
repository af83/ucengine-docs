CC_GOLLUM_SITE += --allow_elements embed,object --allow_attributes src --allow_protocols irc

doc: clean
	gollum-site generate $(CC_GOLLUM_SITE)

	cd _site && ln -s Home.html index.html
	rm _site/Makefile

working: clean
	gollum-site generate --working $(CC_GOLLUM_SITE)

	cd _site && ln -s Home.html index.html
	rm _site/Makefile
	gollum-site serve

validate:
	validate-website -s http://localhost:8000/ -n

clean:
	rm -rf _site
