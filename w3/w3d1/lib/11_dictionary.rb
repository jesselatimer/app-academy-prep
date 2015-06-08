class Dictionary

  attr_reader :entries

  def initialize
    @entries = {}
  end

  def add(entry)
    @entries[entry] = nil if entry.class == String
    @entries.merge!(entry) if entry.class == Hash
  end

  def keywords
    entries.keys.sort
  end

  def include?(keyword)
    entries.has_key?(keyword)
  end

  def find(keyword)
    entries.select { |k, v| k.match(/#{keyword}+/) }
  end

  def printable
    printable_entries = []
    @entries.each do |k, v|
      printable_entries << "[#{k}] \"#{v}\""
    end
    printable_entries.sort.join("\n")
  end

end
