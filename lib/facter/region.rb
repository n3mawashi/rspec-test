# frozen_string_literal: true

# country - if pp_region external fact is set then return the value of pp_region fact,
#        - otherwise, hostname starts with PM , then 'BSP' , else first 3 character of hostname

require 'facter'

# module Country::Facts returns the counrty code from the hostname.
module Facts
  # region reads from an existing fact
  class Region
    def self.add_facts
      Facter.add('region') do
        setcode do
          if Facter.value('pp_region').nil?
            Facter.value('region').upcase
          else
            Facter.value('pp_region').upcase
          end
        end
      end
    end
  end
end

# If we're being loaded inside the module, we'll need to go ahead and add our
# facts then won't we?
Facts::Region.add_facts
