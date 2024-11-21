import org.janusgraph.util.system.ConfigurationUtil
import org.janusgraph.core.ConfiguredGraphFactory

if(ConfiguredGraphFactory.getTemplateConfiguration() == null) {
    conf = ConfigurationUtil.loadPropertiesConfig("/etc/opt/janusgraph/janusgraph-template.properties")
    ConfiguredGraphFactory.createTemplateConfiguration(conf)
}