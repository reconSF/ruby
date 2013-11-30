# A restaurant has incoming orders for which you need to compute the costs based on the menu

class Restaurant
    def initialize(menu)
        @menu = menu
    end

    def cost(*orders)
        orders.inject(0) do |total_cost, order|
            total_cost + order.keys.inject(0) {|cost, key| cost + @menu[key]*order[key] }
        end
    end
end
