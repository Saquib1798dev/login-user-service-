class Createotps < ActiveRecord::Migration[6.0]
  def change
    create_table :otps do |t|
      t.integer :otp_digits
      t.boolean :otp_verified
      t.string  :otp_type
      t.string :otp_token
      t.timestamps
    end
    add_reference :otps, :user, index: true
    add_index :otps, :otp_digits, unique: true
    add_index :otps, :otp_token, unique: true
  end
end
