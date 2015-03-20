class Setting < ActiveRecord::Base


  def self.setup?
    Setting.setup
  end

  def self.method_missing(method, *args, &block)
    if Setting.exists(label: method)
      Setting.find_by(label: method).value
    else
      super
    end
  end

end
