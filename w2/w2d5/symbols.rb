def super_print(str, options = {})
  defaults = {
    :times => 1,
    :upcase => false,
    :reverse => false
  }

  options = defaults.merge(options)

  str.upcase!  if options[:upcase]
  str.reverse! if options[:reverse]
  puts str      * options[:times]
end

super_print("Hello")
super_print("Hello", :times => 3)
super_print("Hello", :times => 3, :upcase => true, :reverse => true)
