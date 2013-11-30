class Book
    def initialize(title = "")
        @title = title
    end
    
    def title()
        @title
    end
    
    def title=(val)
        exceptions = %w{a an the in and but or for nor of over}
        t = val.split.each_with_index.map{|x, i| exceptions.include?(x) && i > 0 ? x : x.capitalize }.join(" ")
        @title = t
    end
end


