#!/usr/bin/ruby
$:.unshift(File.dirname(__FILE__))

require 'blinky'

light = Blinky.new.light
light.watch_cctray_server "https://jenkins-ci.dev.acx/cc.xml"
