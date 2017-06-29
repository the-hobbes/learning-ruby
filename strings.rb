def single_quote
  # single quote string here
  return 'Hello World and others!'
end

def double_quote
  # Double quote string here
  return "Hello World and others!"
end

def here_doc
  # Here doc string here
  return <<-HERE
  Hello World and others!
  HERE
end

def transcode(str)
  # takes an ISO8859-1 encoded string as an argument, converts it and returns a
  # UTF-8 encoded string.
  return str.force_encoding(Encoding::UTF_8)
end

def serial_average(str)
  # input in the form of: SSS-XX.XX-YY.YY
  # returns a string containing the answer in format SSS-ZZ.ZZ where SSS is the
  # serial number of that input string, and ZZ.ZZ is the average of XX.XX and
  # YY.YY
  serial = str[0,3]
  z_num = str[4,5].to_f
  y_num = str[10,11].to_f
  avg = (z_num + y_num) / 2

  return "#{serial}-%.2f" % avg.round(2)
end

def count_multibyte_char(str)
  # takes a string as input and returns the number of multibyte characters
  # (byte size > 1) in it.
  count = 0
  str.each_char do |char|
    count += 1 if char.bytesize > 1
  end
  return count
end

def process_text(arr)
  # takes an array of strings as input and returns a single joined string with 
  # all flanking whitespace and new lines removed.
  fin_arr = []
  arr.each do |str|
    fin_arr.push(str.chomp.strip)
  end
  return fin_arr.join(" ")
end

module StringProcessor
  def StringProcessor.mask_article(text, words)
    words.each do |word|
      text.gsub!(word, strike(word)) if text.include? word
    end
    return text
  end

  def StringProcessor.strike(str)
    return "<strike>#{str}</strike>"
  end
end

puts StringProcessor.mask_article("Hello World! This is crap!", ["crap"])
puts StringProcessor.strike("crap")

