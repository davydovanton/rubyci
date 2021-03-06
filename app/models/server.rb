class Server < ActiveRecord::Base
  validates :name, :length => { :in => 3..30 }
  validates :arch, :inclusion => { :in => %w(- x86 x64 ppc64 ppc64le armhf sparc sparc64),
        :message => "%{value} is not a valid arch" }
  validates :os, :length => { :in => 1..20 }
  validates :version, :length => { :in => 1..20 }
  validates :uri, :length => { :in => 20..200 }
  validates :ordinal, :numericality => true, :uniqueness => true

  def recent_uri(branch)
    "#{uri.chomp('/')}/ruby-#{branch}/recent.html"
  end
end
