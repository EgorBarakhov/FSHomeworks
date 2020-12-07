class Sequence
  def main(seed)
    input = seed
    abort if input.nil? || input.empty?
    input.chomp!
    if input !~ /[0-9]+[ ][0-9]+/
      abort "input #{input} should contains initial sequence and number of elements separated by space"
    end
    initial_sequence, number_of_str = input.split(" ")
    i = 0
    current_sequence = initial_sequence
    next_sequence = ""
    while i < number_of_str.to_i - 1
      pos = 0
      length = current_sequence.length
      while pos < length
        counter = 1
        while (pos + 1 != length) & (current_sequence[pos] == current_sequence[pos + 1])
          counter += 1
          pos += 1
        end
        next_sequence = next_sequence + counter.to_s + current_sequence[pos]
        pos += 1
      end
      current_sequence = next_sequence
      next_sequence = ""
      i += 1
    end
    next_sequence
  end
end
