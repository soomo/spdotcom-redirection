require 'bundler'
Bundler.setup

require 'rack'
require 'rack/rewrite'

use Rack::Rewrite do
	r301 %r{.*}, 'http://www.soomolearning.com$&'
end

router = Proc.new do |env|
	[ 404, {}, ["Not found."] ]
end

run router
