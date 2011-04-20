doc:
	gollum-site generate

	cd _site && ln -s Home.html index.html
	rm _site/Makefile

working: clean
	gollum-site generate --working

	cd _site && ln -s Home.html index.html
	rm _site/Makefile
	gollum-site serve

validate:
	validate-website -s http://localhost:8000/ -n --no-markup-validation

clean:
	rm -rf _site
