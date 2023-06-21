# get data from our producer into ElasticSearch
connect-standalone config/connect-standalone.properties config/elasticsearch.properties

GET wikimedia.recentchange/_search
{
 "query": {
   "match_all": {}
 }
}