# Question 1 -- sortByStrings(s,t): 
# Sort the letters in the string s by the order they occur in the string t. 
# You can assume t will not have repetitive characters. For s = "weather" and t = "therapyw", 
# the output should be sortByString(s, t) = "theeraw". For s = "good" and t = "odg", the output should be sortByString(s, t) = "oodg".

def sortByStrings(string, sort_string)
  string.chars.sort {|x,y| sort_string.index(x) <=> sort_string.index(y) }.join
end
