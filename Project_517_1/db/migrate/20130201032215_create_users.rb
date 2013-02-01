class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password

      t.boolean :admin
      t.timestamps
    end

    # create admin user
    user = User.new
    user.username = 'admin'
    user.password = 'admin'
    user.admin = true
    user.save

  end
end
