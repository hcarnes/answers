# Question 2 -- decodeString(s): Given an encoded string, return its corresponding decoded string. 

# The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets 
# is repeated exactly k times. Note: k is guaranteed to be a positive integer. 

# For s = "4[ab]", the output should be decodeString(s) = "abababab" 
# For s = "2[b3[a]]", the output should be decodeString(s) = "baaabaaa"


s = "4[ab]"

s = "2[b3[a]]"

def decodeString(s)
  accm = decodeStringImpl(s, [])
  accm.each.with_index.reduce("") {|m,(e,i)| (e[0]+m)*(accm[i+1] && accm[i+1][1] || 1) }
end

def decodeStringImpl(s, accm = [])
  regex = /(?<left>\w*?)?(?<repeatcount>\d+)\[(?<repeatstring>.+)\](?<right>\w*?)?/

  if s.match(regex)
    matches = s.match(regex)
    decodeStringImpl(matches["repeatstring"], [[matches["left"], matches["repeatcount"].to_i, matches["right"]]] + accm)
  else
    [[s, 1, ""]] + accm
  end
end

decodeString(s)