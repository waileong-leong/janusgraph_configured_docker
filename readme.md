# Gremlin

docker run --rm --network janusgraph_configured_docker_jce-network -e GREMLIN_REMOTE_HOSTS=jce-janusgraph \
    -it janusgraph/janusgraph:1.1.0 ./bin/gremlin.sh

# Gremlin Command

:remote connect tinkerpop.server conf/remote.yaml session
:remote console session
ConfiguredGraphFactory.getGraphNames()