require File.dirname(__FILE__) + "lib/core_ext/jp_blank"
require File.dirname(__FILE__) + "lib/active_record/errors"
require File.dirname(__FILE__) + "lib/active_record/jpvalidator"

ActiveRecord::Base.send :include, ActiveRecord::Jpvalidator

