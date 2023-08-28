class Dail < ApplicationRecord
	encrypts :rent, deterministic: true
end
