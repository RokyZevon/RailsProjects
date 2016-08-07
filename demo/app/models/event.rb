class Event < ApplicationRecord
	validates :name, presence: true

	belongs_to :category

	has_one :location, dependent: :destroy

	has_many :attendees, dependent: :destroy
	has_many :event_groupships
	has_many :groups, through: :event_groupships

	delegate :name, to: :category, prefix: true, allow_nil: true

	accepts_nested_attributes_for :location, allow_destroy: true, reject_if: :all_blank
	# accepts_nested_attributes_for這個方法可以讓更新event資料時，也可以直接更新location的關聯資料。也就是說，我們可以完全不需要修改events_controller的新增和編輯Action，就可以透過本來的params[:event]參數來新增或修改location了。這裡有兩個特別的參數，:allow_destroy是說我們可以在表單中多放一個_destroy核選塊來表示刪除，而:reject_if表示說在什麼條件下，就當做沒有要真的動作，例如:all_blank就表示如果資料都是空的，就不建立location資料(當然也就不會檢查location的驗證了)。這是因為雖然要顯示location表單，但是不表示使用者一定要輸入。有輸入就表示必須通過Location Model的資料驗證。 
end
