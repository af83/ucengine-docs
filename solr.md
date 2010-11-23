# Solr

Using the [Apache-Solr](http://lucene.apache.org/solr/) connector is the more efficient way to handle full-text search queries.

## Installation

* Take a look at the [Solr tutorial](http://lucene.apache.org/solr/tutorial.html) page to install it.

* Use the XML schema located at ucengine/contrib/solr_schema.xml

## Use it in UCEngine

* Open the configuration file at etc/uce.cfg
* Add or change the search_engine option with:
  {search_engine, solr}.
* Add the solr configuration:
  {solr, [{host, "http://localhost:8983/solr"}]}.
