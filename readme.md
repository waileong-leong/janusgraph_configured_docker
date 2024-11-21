#Run
docker compose up

#Check config
docker compose run janusgraph janusgraph show-config -rm

#Gremlin
docker-compose exec janusgraph ./bin/gremlin.sh

docker run --rm --network docker_jce-network -e GREMLIN_REMOTE_HOSTS=jce-janusgraph \
    -it janusgraph/janusgraph:1.1.0 ./bin/gremlin.sh

:remote connect tinkerpop.server conf/remote.yaml session
:remote console session
ConfiguredGraphFactory.getGraphNames()