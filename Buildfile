require "buildr"

# Keep this structure to allow the build system to update version numbers.
VERSION_NUMBER = "6.0.0.34-SNAPSHOT"

repositories.remote = [ 
  "http://www.intalio.org/public/maven2", 
  "http://repo1.maven.org/maven2",
  "http://people.apache.org/repo/m2-ibiblio-rsync-repository/"
]

repositories.release_to[:username] ||= "release"
repositories.release_to[:url] ||= "sftp://www.intalio.org/var/www-org/public/maven2"
repositories.release_to[:permissions] ||= 0664

APACHE_COMMONS = {
  :codec => "commons-codec:commons-codec:jar:1.3",
  :collections => "commons-collections:commons-collections:jar:3.2", 
  :lang => "commons-lang:commons-lang:jar:2.3",
}
CAS_CLIENT = "cas:casclient:jar:2.1.1"
JDOM = "jdom:jdom:jar:1.0"
BACKPORT = "backport-util-concurrent:backport-util-concurrent:jar:3.1"
CAS_LIBS = [
  group("cas-server-core",:under=>"org.jasig.cas", :version=>"3.2.1.1"),
  group("cas-server-support-ldap",:under=>"org.jasig.cas", :version=>"3.2.1.1"),
  "org.acegisecurity:acegi-security:jar:1.0.6",
  "aopalliance:aopalliance:jar:1.0",
  "aspectj:aspectjrt:jar:1.5.3",
  "aspectj:aspectjweaver:jar:1.5.3",
  JDOM,
  BACKPORT,
  CAS_CLIENT,
  APACHE_COMMONS[:codec],
  APACHE_COMMONS[:collections],
  APACHE_COMMONS[:lang],
  "net.sf.ehcache:ehcache:jar:1.4.0-beta2",
  "quartz:quartz:jar:1.5.2",
  "net.sf.jsr107cache:jsr107cache:jar:1.0",
  "inspektr:core:jar:0.6.1",
  "oro:oro:jar:2.0.8",
  "jstl:jstl:jar:1.1.2",
  "ognl:ognl:jar:2.6.9",
  "opensaml:opensaml:jar:1.1b",
  "javax.persistence:persistence-api:jar:1.0",
  "person.directory:api:jar:1.1.1",
  "person.directory:impl:jar:1.1.1",
  "quartz:quartz:jar:1.5.2",
  group("spring-aop","spring-beans","spring-context", "spring-context-support", "spring-core", "spring-jdbc","spring-orm", "spring-tx", "spring-web", "spring-webmvc",:under=>"org.springframework", :version=>"2.5.1"),
  group("spring-ldap", "spring-ldap-tiger",:under=>"org.springframework", :version=>"1.2.1"),
  group("spring-binding", "spring-webflow",:under=>"org.springframework", :version=>"1.0.5"), 
  "xml-security:xmlsec:jar:1.4.0",
  "taglibs:standard:jar:1.1.2"
]

desc "Embedded CAS Server"
define "cas-webapp" do
  project.version = VERSION_NUMBER
  project.group = "org.intalio.tempo"
  compile.options.target = "1.5"
  
  compile.with CAS_LIBS
  package(:war).with
end