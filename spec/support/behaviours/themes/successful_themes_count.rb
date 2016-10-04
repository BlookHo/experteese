shared_examples :successful_themes_rows_count do
  it '- check Theme have rows count - Ok' do
    themes_count =  Theme.all.count
    puts "in successful_themes_rows_count: themes_count = #{themes_count.inspect} \n"
    expect(themes_count).to eq(rows_qty) # got rows_qty of Theme
  end
end

