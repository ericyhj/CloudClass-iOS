Pod::Spec.new do |spec|
  spec.name         = "AgoraExtApp"
  spec.version      = "1.0.0"
  spec.summary      = "Agora extension app"
  spec.description  = "Agora extension app"

  spec.homepage     = "https://bitbucket.agoralab.co/projects/ADUC/repos/cloudclass-ios"
  spec.license      = "MIT"
  spec.author       = { "Cavan" => "suruoxi@agora.io" }
  spec.ios.deployment_target = "10.0"
  spec.source       = { :git => "ssh://git@git.agoralab.co/aduc/cloudclass-ios.git", :tag => "#{spec.version}" }
  
  spec.source_files  = "AgoraExtApp/**/*.{h,m,swift}"

  spec.module_name   = 'AgoraExtApp'
  spec.swift_versions = ['5.0', '5.1', '5.2', '5.3']

  spec.dependency "AgoraUIBaseViews"

  spec.xcconfig = {
   'USER_HEADER_SEARCH_PATHS' => [
     '$(SRCROOT)/../Swift/**'
   ]
  }

  spec.script_phase = {
    :name => 'Copy SwiftInterface.h',
    :script => 'rm -rf ${SRCROOT}/../Swift/${PRODUCT_MODULE_NAME}-Swift.h && cp ${DERIVED_SOURCES_DIR}/*-Swift.h ${SRCROOT}/../Swift/'
  }
  
end
