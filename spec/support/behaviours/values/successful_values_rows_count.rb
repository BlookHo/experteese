shared_examples :successful_values_rows_count do
  it '- check Value have rows count - Ok' do
    values_count =  Value.all.count
    puts "in successful_values_rows_count: values_count = #{values_count.inspect} \n"
    expect(values_count).to eq(rows_qty) # got rows_qty of Value
  end
end

