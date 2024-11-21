FROM janusgraph/janusgraph:1.1.0

# Download and replace libraries
RUN mkdir -p /tmp/newlibs && \
    cd /tmp/newlibs && \
    wget https://repo1.maven.org/maven2/org/janusgraph/scylla-hadoop-util/1.0.0/scylla-hadoop-util-1.0.0.jar && \
    wget https://repo1.maven.org/maven2/org/janusgraph/janusgraph-scylla/1.0.0/janusgraph-scylla-1.0.0.jar && \
    wget https://repo1.maven.org/maven2/com/scylladb/java-driver-core/4.17.0.1/java-driver-core-4.17.0.1.jar && \
    wget https://repo1.maven.org/maven2/com/scylladb/java-driver-query-builder/4.17.0.1/java-driver-query-builder-4.17.0.1.jar && \
    wget https://repo1.maven.org/maven2/com/scylladb/scylla-driver-core/3.11.5.3/scylla-driver-core-3.11.5.3.jar

# Replace the libraries
RUN rm /opt/janusgraph/lib/cassandra-hadoop-util-*.jar && \
    rm /opt/janusgraph/lib/java-driver-core-*.jar && \
    rm /opt/janusgraph/lib/java-driver-query-builder-*.jar && \
    rm /opt/janusgraph/lib/cassandra-driver-core-*.jar && \
    mv /tmp/newlibs/*.jar /opt/janusgraph/lib/ && \
    rm -rf /tmp/newlibs

# Set the storage backend to ScyllaDB
ENV JANUSGRAPH_STORAGE_BACKEND=scylla