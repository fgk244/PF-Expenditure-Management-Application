class PaymentRecord < ApplicationRecord

  validates :payment, presence: true
  attachment :voucher
  belongs_to :category
  belongs_to :user

   scope :search, -> (search_params) do      #scopeでsearchメソッドを定義。(search_params)は引数
    return if search_params.blank?      #検索フォームに値がなければ以下の手順は行わない

      date_in_from(search_params[:from_date]).date_in_to(search_params[:to_date])
      .category_id(search_params[:category_id])
      .payment_method(search_params[:payment_method])
      .memo(search_params[:memo])
      #下記で定義しているscopeメソッドの呼び出し。「.」で繋げている
   end

   #scopeを定義。
   scope :date_in_from, -> (from) { where('? <= payment_records.date', from) if from.present? }
   scope :date_in_to, -> (to) { where('payment_records.date <= ?', to) if to.present? }
   #日付の範囲検索をするため、fromとtoをつけている
   scope :category_id, -> (category_id) { where('category_id LIKE ?', "%#{category_id}%") if category_id.present? }
   scope :payment_method, -> (payment_method) { where('payment_method LIKE ?', "%#{payment_method}%") if payment_method.present? }
   scope :memo, -> (memo) { where('memo LIKE ?', "%#{memo}%") if memo.present? }
   #scope :メソッド名 -> (引数) { SQL文 }
   #if 引数.present?をつけることで、検索フォームに値がない場合は実行されない

end
