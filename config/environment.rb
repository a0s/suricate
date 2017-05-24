$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), %w(.. lib))))

require 'pp'
require 'maxminddb'
require 'json'
require 'sinatra'
require 'sinatra/param'
require 'suricate'
