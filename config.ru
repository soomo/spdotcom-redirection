require 'bundler'
Bundler.setup

require 'rack'
require 'rack/rewrite'

use Rack::Rewrite do
	r301 %r{.*}, 'http://www.soomolearning.com$&', host: 'soomopublishing.com' # APEX
	r301 %r{.*}, 'http://www.soomolearning.com$&', host: 'www.soomopublishing.com'
	r302 %r{.*}, 'http://www.soomolearning.com/user-resources/wgu-learning-resource-no-longer-available', host: 'courses.soomopublishing.com' # Legacy SLE
	r301 %r{.*}, 'http://courseanalytics.com', host: 'www.courseanalytics.com'
end

router = Proc.new do |env|
	[ 404, {}, ["Not found."] ]
end

run router
