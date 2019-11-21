module ActiveRecord
  module Delegation
    alias at []
  end
end

module ActiveRecord
  module AttributeMethods
    alias fetch []
    alias store []=
  end
end

module ActionDispatch
  class Request
    class Session
      alias fetch []
      alias store []=
    end
  end

  class Cookies
    class CookieJar
      alias fetch []
      alias store []=
    end
  end
end
