class User < ApplicationRecord
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :birthday, presence: true
  validates :nickname, presence: true

  # パスワードは半角英数字混合かどうか
  VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*\d)[a-z\d]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数字混合で入力してください' }

  # 名前（全角）バリデーション
  validates :last_name,  presence: true,
                         format: { with: /\A[ぁ-んァ-ン一-龥々ーヶ]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :first_name, presence: true,
                         format: { with: /\A[ぁ-んァ-ン一-龥々ーヶ]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }

  # 名前カナ（全角カタカナ）バリデーション
  validates :last_name_kana,  presence: true,
                              format: { with: /\A[ァ-ンーヶ]+\z/, message: 'は全角カタカナで入力してください' }
  validates :first_name_kana, presence: true,
                              format: { with: /\A[ァ-ンーヶ]+\z/, message: 'は全角カタカナで入力してください' }

  

end
