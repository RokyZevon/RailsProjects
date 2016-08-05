class Article < ApplicationRecord

	has_many :comments, dependent: :destroy

	# validate -> "验证"; presence -> "存在";
	# 验证title，必须存在，必须不小于5
	validates :title, presence: true, length: { minimum: 5 }
end
