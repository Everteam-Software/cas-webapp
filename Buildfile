require "buildr"
require "install.rb"
require "/build/common.rb"

# Keep this structure to allow the build system to update version numbers.
VERSION_NUMBER = "6.0.0.38-SNAPSHOT"

repositories.remote = [ 
  "http://www.intalio.org/public/maven2", 
  "http://repo1.maven.org/maven2",
  "http://people.apache.org/repo/m2-ibiblio-rsync-repository/",
  "http://developer.jasig.org/repo/content/repositories/m2"
]

repositories.release_to[:username] ||= "release"
repositories.release_to[:url] ||= "sftp://www.intalio.org/var/www-org/public/maven2"
repositories.release_to[:permissions] ||= 0664


desc "Embedded CAS Server"
define "cas-webapp" do
  project.version = VERSION_NUMBER
  project.group = "org.intalio.tempo"
  compile.options.target = "1.5"
  
  compile.with CAS_LIBS
  package(:war).with
end

#Delete build folder
rm_rf "build"