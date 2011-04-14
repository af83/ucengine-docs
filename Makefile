doc:
	gollum-site generate

	cd _site && ln -s Home.html index.html
	rm _site/Makefile

validate:
	validate-website -s http://localhost:8000/ -n --no-markup-validation

clean:
	rm -rf _site
