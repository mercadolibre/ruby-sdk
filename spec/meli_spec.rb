# encoding: UTF-8

require 'spec_helper'

describe Meli do

  before do
    @client_id = "1234567"
    @secret_code = "a secret"
    @access_token = "access_token"
    @refresh_token = "refresh_token"
    @new_access_token = "a new access_token"
    @new_refresh_token = "a new refresh_token"

    @meli = Meli.new @client_id, @secret_code, @access_token, @refresh_token

    @meli.https.stub(:request) do |req|
      case req.method
      when "GET"
        if req.path =~ /\/users\/me/
          if req.path =~ /access_token/
            Net::HTTPOK.new(1, 200, "OK")
          else
            Net::HTTPForbidden.new(1, 403, "Forbidden")
          end
        else
          Net::HTTPOK.new(1, 200, "OK")
        end
      when "POST"
        if req.path =~ /\/oauth\/token/
          if !req.path =~ /grant_type/ || !req.path =~ /client_id/ || !req.path =~ /client_secret/
            Net::HTTPForbidden.new(1, 403, "Forbidden")
          else
            response = Net::HTTPOK.new(1, 200, "OK")
            if req.body =~ /grant_type=authorization_code/
              def response.body
                {:access_token => 'access_token', :refresh_token => 'refresh_token'}.to_json
              end
            elsif req.body =~ /grant_type=refresh_token/
              def response.body
                {:access_token => 'a new access_token', :refresh_token => 'a new refresh_token'}.to_json
              end
            end
          end
          response
        else
          if req.path =~ /access_token/
            Net::HTTPOK.new(1, 200, "OK")
          else
            Net::HTTPForbidden.new(1, 403, "Forbidden")
          end
        end
      when "PUT"
        if req.path =~ /access_token/
          Net::HTTPOK.new(1, 200, "OK")
        else
          Net::HTTPForbidden.new(1, 403, "Forbidden")
        end
      when "DELETE"
        if req.path =~ /access_token/
          Net::HTTPOK.new(1, 200, "OK")
        else
          Net::HTTPForbidden.new(1, 403, "Forbidden")
        end
      else
        Net::HTTPInternalServerError.new(1, 500, "Internal Server Error")
      end
    end #stub
  end #before each

  describe "Requireds Gems" do
    it "should have json gem version 1.8.0" do
      expect(Gem::Specification::find_all_by_name('json').any?).to be_truthy
    end
  end

  describe "#new" do
    it "should return a Meli object" do
      expect(@meli).to be_an_instance_of Meli
    end
    it "should return corret app_id" do
      expect(@meli.app_id).to eq @client_id
    end
    it "should return corret secret" do
      expect(@meli.secret).to eq @secret_code
    end
    it "should return correct access_token" do
      expect(@meli.access_token).to eq @access_token
    end
    it "should return correct refresh_token" do
      expect(@meli.refresh_token).to eq @refresh_token
    end
    it "should return a net/http service" do
      expect(@meli.https).to be_an_instance_of Net::HTTP
    end
    it "should have a http service with ssl" do
      expect(@meli.https.use_ssl?).to be_truthy
    end
  end

  describe "http methods" do
    it "should return a reponse from get" do
      response = @meli.get("/items/test1")
      expect(response).to be_an_instance_of Net::HTTPOK
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
      expect(response).to be_an_instance_of Net::HTTPOK
    end
    it "should return a reponse from put" do
      body = {"title"=>"New Title", "price"=>1000}
      response = @meli.put("/items/test1", body, {:access_token => @meli.access_token})
      expect(response).to be_an_instance_of Net::HTTPOK
    end
    it "should return a reponse from delete" do
      response = @meli.delete("/questions/123", {:access_token => @meli.access_token})
      expect(response).to be_an_instance_of Net::HTTPOK
    end
    it "get should return forbidden without access_token" do
      response = @meli.get("/users/me")
      expect(response).to be_an_instance_of Net::HTTPForbidden
    end
    it "get should return OK with access_token" do
      response = @meli.get("/users/me", {:access_token => @meli.access_token})
      expect(response).to be_an_instance_of Net::HTTPOK
    end
  end

  describe "Auth Url" do
    let(:callback) { "http://test.com/callback" }
    it "should return the correct default auth url (for Brazil)" do
      expect(@meli.auth_url(callback)).to match "^https\:\/\/auth.mercadolivre.com.br\/authorization"
      expect(@meli.auth_url(callback)).to match callback
      expect(@meli.auth_url(callback)).to match @client_id
      expect(@meli.auth_url(callback)).to match "response_type"
    end
    
    context "with two parameters" do
      let(:iso_country_code) { "AR" }
      it "should return the correct auth url according to the country" do
        expect(@meli.auth_url(callback, iso_country_code)).to match "^https\:\/\/auth.mercadolibre.com.ar\/authorization"
        expect(@meli.auth_url(callback, iso_country_code)).to match callback
        expect(@meli.auth_url(callback, iso_country_code)).to match @client_id
        expect(@meli.auth_url(callback, iso_country_code)).to match "response_type"
      end
    end
  end

  describe "Authorize" do
    it "should return Access Token" do
      @meli.access_token = nil
      @meli.refresh_token = nil
      @meli.authorize("a code from get param", "A redirect Uri")
      expect(@meli.access_token).to eq @access_token
      expect(@meli.refresh_token).to eq @refresh_token
    end
  end

  describe "Refresh Token" do
    it "should return new Access Token and a new Refresh Token" do
      response = @meli.get_refresh_token
      expect(@meli.access_token).to eq @new_access_token
      expect(@meli.refresh_token).to eq @new_refresh_token
    end
  end

end
