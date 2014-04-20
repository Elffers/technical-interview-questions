
def next_n_entries(string, iterations)
  array = []
  iterations.times do
    string = string.next
    array.push string
  end
  array
end