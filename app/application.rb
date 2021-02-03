class Application

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            param = req.path.split(/\/items\//)
            item = Item.all.select{|item| item.name == param[1]}[0]
            if item
                resp.write item.price
            else
                resp.write "Item not found"
                resp.status = 400
            end
        else
            resp.write "Route not found"
            resp.status = 404
        end 

        resp.finish
    end


end

