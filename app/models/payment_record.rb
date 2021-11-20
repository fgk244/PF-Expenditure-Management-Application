class PaymentRecord < ApplicationRecord

  attachment :voucher

  belongs_to :category
  # belongs_to :budget

  belongs_to :user

  belongs_to :budget, optional: true


   scope :search, -> (search_params) do      #scopeでsearchメソッドを定義。(search_params)は引数
    return if search_params.blank?      #検索フォームに値がなければ以下の手順は行わない

      date_in_from(search_params[:from_date]).date_in_to(search_params[:to_date])
      .category(search_params[:category])
      .payment_method(search_params[:payment_method])
      .memo(search_params[:memo])
      #下記で定義しているscopeメソッドの呼び出し。「.」で繋げている
  end

  scope :payment_record, -> (payment) { where('payment_record LIKE ?', "%#{payment}%") if payment.present? }  #scopeを定義。
  scope :date_in_from, -> (from) { where('? <= payment_records.date', from) if from.present? }
  scope :date_in_to, -> (to) { where('payment_records.date <= ?', to) if to.present? }
   #日付の範囲検索をするため、fromとtoをつけている
  scope :category, -> (category) { where('category LIKE ?', "%#{category}%") if category.present? }
  scope :payment_method, -> (payment_method) { where('payment_method LIKE ?', "%#{payment_method}%") if payment_method.present? }
  scope :memo, -> (memo) { where('memo LIKE ?', "%#{memo}%") if memo.present? }
 #scope :メソッド名 -> (引数) { SQL文 }
 #if 引数.present?をつけることで、検索フォームに値がない場合は実行されない



end
