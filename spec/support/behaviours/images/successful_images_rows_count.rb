shared_examples :successful_images_rows_count do
  it '- check Image have rows count - Ok' do
    images_count =  Image.all.count
    puts "in successful_images_rows_count: images_count = #{images_count.inspect} \n"
    expect(images_count).to eq(rows_qty) # got rows_qty of Image
  end
end

