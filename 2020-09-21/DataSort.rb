require 'csv'
# puts table[0]["First Name"]
# puts table.by_col[3]
NUMBER_OF_COLUMNS = 5

def input
  puts "Select column which table should be sorted by"
  puts "1. First Name, 2. Second Name, 3. Phone Number, 4. Address, 5. Website URL"
  gets.to_i - 1
end

def main
  table = CSV.read("./resources/data.csv", headers: true)
  column_index = input
  if column_index < 0 || column_index >= NUMBER_OF_COLUMNS
    abort "Wrong argument!"
  end

  i = 0
  while i < table.length - 1
    phone_number = table[i][2]
    if phone_number != " "
      table[i][2] = " #{phone_number.delete(" ")}"
    end
    i += 1
  end

  tmp = i = 0
  j = 1
  while i < table.length - 1
    swap = table[i][column_index]
    while j < table.length
      if swap > table[j][column_index]
        swap = table[j][column_index]
        tmp = j
      end
      j += 1
    end
    k = 0
    while k < NUMBER_OF_COLUMNS
      temp_swap = table[i][k]
      table[i][k] = table[tmp][k]
      table[tmp][k] = temp_swap
      k += 1
    end
    i += 1
    j = i + 1
  end

  filename = "data_sorted_by_#{column_name(column_index)}"
  File.write(filename, table.to_s)
end

def column_name(column_index)
  case column_index
  when 0
    return "first_name"
  when 1
    return "second_name"
  when 2
    return "phone_number"
  when 3
    return "address"
  else
    return "website_url"
  end
end

main
