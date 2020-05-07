shared_examples :successful_users_rows_count do
  it '- check User have rows count - Ok' do
    users_count =  User.all.count
    puts "in successful_users_rows_count: users_count = #{users_count.inspect} \n"
    expect(users_count).to eq(rows_qty) # got rows_qty of User
  end
end

