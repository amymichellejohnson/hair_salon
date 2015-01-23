require("spec_helper")

describe(Client) do

  describe(".all") do
    it("is initially empty") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("is the same client if he/she has the same name and stylist_id") do
      client1 = Client.new({:name => "Nancy",:stylist_id => 1})
      client2 = Client.new({:name => "Nancy",:stylist_id => 1})
      expect(client1).to(eq(client2))
    end
  end

  describe("#name") do
    it("lets you read the client name out") do
      test_client = Client.new({:name => "Nancy", :stylist_id => 3})
      expect(test_client.name()).to(eq("Nancy"))
    end
  end

  describe("#stylist_id") do
    it("lets you read the stylist_id out") do
      test_client = Client.new({:name => "Nancy", :stylist_id => 3})
      expect(test_client.stylist_id()).to(eq(3))
    end
  end

  describe("#save") do
    it("adds a client to the array of saved clients") do
      test_client = Client.new({:name => "Nancy", :stylist_id => 3})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end
end
