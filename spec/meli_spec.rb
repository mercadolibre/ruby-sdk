require 'spec_helper'

describe Meli do

    before(:each) do
       @meli = Meli.new "1234567", "secretcode", "access_token", "refresh_token"
    end

    describe "#new" do
        it "should return a Meli object" do
            @meli.should be_an_instance_of Meli
        end
        it "should return corret app_id" do
            @meli.app_id.should == "1234567"
        end
        it "should return corret secret" do
            @meli.secret.should == "secretcode"
        end
        it "should return correct access_token" do
            @meli.access_token.should == "access_token"
        end
        it "should return correct refresh_token" do
            @meli.refresh_token.should == "refresh_token"
        end
        it "should return a net/http service" do
            @meli.https.should be_an_instance_of Net::HTTP
        end
        it "should have a http service with ssl" do
            @meli.https.use_ssl.should be_true
        end
    end
end
