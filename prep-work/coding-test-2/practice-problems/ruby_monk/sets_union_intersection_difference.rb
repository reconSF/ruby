puts
operating_systems = ["Fedora", "SuSE", "RHEL", "Windows", "MacOS"]
puts "Operating_systems: " << operating_systems.inspect
linux_systems = ["RHEL", "SuSE", "PCLinuxOS", "Ubuntu", "Fedora"]
puts "linux_systems: " << linux_systems.inspect
puts
puts
puts "Union(|): " << (operating_systems | linux_systems).inspect
puts "----------"
puts "Intersection(&): " << (operating_systems & linux_systems).inspect
puts "----------"
puts "Difference(-): " << (operating_systems - linux_systems).inspect
puts "----------"
puts "Remove Duplicates(uniq)" << linux_systems.uniq.inspect
puts

class Order
    GIFT_ITEMS = [:big_white_tshirt, :awesome_stickers]
    OUT_OF_STOCK_ITEMS = [:ssd_harddisk]

    def initialize(order)
        @order = order || []
    end

    def final_order
        @order = (@order | GIFT_ITEMS) - OUT_OF_STOCK_ITEMS
    end
end

customer_order = Order.new([:fancy_bag, :ssd_harddisk])
p customer_order.final_order