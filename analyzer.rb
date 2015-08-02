#initialize stopwords
stopwords = %w{the a by on for of are with just but and to the my I has some in}
#read in file
lines=File.readlines(ARGV[0])
line_count = lines.size
text=lines.join

#count characters
total_chars = text.length
total_chars_nospaces=text.gsub(/\s+/,'').length

#count words, sentences, and paragraphs
word_count =text.split.length
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length

#make a list of words that aren't stopwords
#count them, and work out the percentage of non-stop/words
all_words=text.scan(/w+/)
interesting_words=all_words.select { |word| !stopwords.include?(word) }
interesting_percentage = ((interesting_words.length.to_f/all_words.length.to_f)*100).to_i

# Summarize the text by cherry picking some choice sentences
sentences = text.gsub(/\s+/,' ').strip.split(/\?|\.|!/)
sentences_sorted = sentences.sort_by {|sentence| sentence.length}
one_third = sentences_sorted.length/3
ideal_sentences = sentences_sorted.slice(one_third, one_third+1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }


#Output findings
puts "#{line_count} lines"
puts "#{total_chars} characters"
puts "#{total_chars_nospaces} characters excluding spaces"
puts "#{word_count} words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count/paragraph_count} sentences per paragraph (average)"
puts "#{word_count/sentence_count} words per sentence (average)"
puts"#{interesting_percentage}% of words are non-fluff words"
puts "Summary:\n\n"+ ideal_sentences.join(". ")
puts"-- end of analysis"
