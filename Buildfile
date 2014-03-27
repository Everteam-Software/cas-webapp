require "buildr"
require "install.rb"

# Keep this structure to allow the build system to update version numbers.
VERSION_NUMBER = "6.0.0.40-SNAPSHOT"

desc "Embedded CAS Server"
define "cas-webapp" do
  project.version = VERSION_NUMBER
  project.group = "org.intalio.tempo"
  
  compile.options.source = "1.5"
  compile.options.target = "1.5"
  
  compile.with CAS_LIBS
  package(:war).with
end
