require 'spec_helper'

describe Meli do

    before(:each) do
        @client_id = "1234567"
        @secret_code = "a secret"
        @access_token = "access_token"
        @refresh_token = "refresh_token"

        @meli = Meli.new @client_id, @secret_code, @access_token, @refresh_token
    end

    describe "#new" do
        it "should return a Meli object" do
            @meli.should be_an_instance_of Meli
        end
        it "should return corret app_id" do
            @meli.app_id.should == @client_id
        end
        it "should return corret secret" do
            @meli.secret.should == @secret_code
        end
        it "should return correct access_token" do
            @meli.access_token.should == @access_token
        end
        it "should return correct refresh_token" do
            @meli.refresh_token.should == @refresh_token
        end
        it "should return a net/http service" do
            @meli.https.should be_an_instance_of Net::HTTP
        end
        it "should have a http service with ssl" do
            @meli.https.use_ssl.should be_true
        end
    end

    describe "http methods" do
        before(:each) do
            @meli.https.stub(:request) do |req|
                case req.method
                when "GET"
                    if req.path =~ /\/users\/me/
                        if req.path =~ /access_token/
                            Net::HTTPOK.new(200, "OK", nil)
                        else
                            Net::HTTPForbidden.new(403, "Forbidden", nil)
                        end
                    else
                        Net::HTTPOK.new(200, "OK", nil)
                    end
                when "POST"
                     if req.path =~ /access_token/
                        Net::HTTPOK.new(200, "OK", nil)
                    else
                        Net::HTTPForbidden.new(403, "Forbidden", nil)
                    end
                when "PUT"
                    if req.path =~ /access_token/
                        Net::HTTPOK.new(200, "OK", nil)
                    else
                        Net::HTTPForbidden.new(403, "Forbidden", nil)
                    end
                when "DELETE"
                    if req.path =~ /access_token/
                        Net::HTTPOK.new(200, "OK", nil)
                    else
                        Net::HTTPForbidden.new(403, "Forbidden", nil)
                    end
                else
                    Net::HTTPInternalServerError.new(500, "Internal Server Error", nil)
                end
            end
        end
        it "should return a reponse from get" do
            response = @meli.get("/items/test1")
            response.should be_an_instance_of Net::HTTPOK
        end
        it "should return a reponse from post" do
        body = {"condition"=>"new",
                "warranty"=>"60 dias",
                "currency_id"=>"BRL",
                "accepts_mercadopago"=>true,
                "description"=>"Lindo Ray_Ban_Original_Wayfarer",
                "listing_type_id"=>"bronze",
                "title"=>"\303\223culos Ray Ban Aviador  Que Troca As Lentes  Lan\303\247amento!",
                "available_quantity"=>64,
                "price"=>289,
                "subtitle"=>"Acompanha 3 Pares De Lentes!! Compra 100% Segura",
                "buying_mode"=>"buy_it_now",
                "category_id"=>"MLB5125",
                "pictures"=>[{"source"=>"http://upload.wikimedia.org/wikipedia/commons/f/fd/Ray_Ban_Original_Wayfarer.jpg"},
                            {"source"=>"http://en.wikipedia.org/wiki/File:Teashades.gif"}]
            }
            response = @meli.post("/items/test1", body, {:access_token => @meli.access_token})
            response.should be_an_instance_of Net::HTTPOK
        end
        it "should return a reponse from put" do
            body = {"title"=>"New Title", "price"=>1000}
            response = @meli.put("/items/test1", body, {:access_token => @meli.access_token})
            response.should be_an_instance_of Net::HTTPOK
        end
        it "should return a reponse from delete" do
            response = @meli.delete("/questions/123", {:access_token => @meli.access_token})
            response.should be_an_instance_of Net::HTTPOK
        end
        it "get should return forbidden without access_token" do
            response = @meli.get("/users/me")
            response.should be_an_instance_of Net::HTTPForbidden
        end
        it "get should return OK with access_token" do
            response = @meli.get("/users/me", {:access_token => @meli.access_token})
            response.should be_an_instance_of Net::HTTPOK
        end
    end

    describe "Auth Url" do
        it "should return the correct auth url" do
            callback = "http://test.com/callback"
            @meli.auth_url(callback).should match "^https\:\/\/auth.mercadolibre.com\/authorization"
            @meli.auth_url(callback).should match callback
            @meli.auth_url(callback).should match @client_id
            @meli.auth_url(callback).should match "response_type"
        end
    end


end
