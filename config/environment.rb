require "bundler/setup"
require "irb"
require 'pry'
require 'nokogiri'
require 'open-uri'
require 'colorize'

require_relative "../lib/podcast/version"
require_relative "../lib/podcast/cli"
require_relative "../lib/podcast/podcast_scraper"
require_relative "../lib/podcast/podcast"