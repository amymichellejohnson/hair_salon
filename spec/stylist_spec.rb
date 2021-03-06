require("spec_helper")

describe(Stylist) do

  describe(".all") do
    it("is initially empty") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a stylist by its ID number") do
      test_stylist = Stylist.new({:name => "Nancy", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Sarah", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#name") do
    it("tells you the stylist's name") do
      stylist = Stylist.new({:name => "Sarah", :id => nil})
      stylist.save()
      expect(stylist.name()).to(eq("Sarah"))
    end
  end

  describe("#id") do
    it("sets the Stylst's ID when you save it") do
      stylist = Stylist.new({:name => "Sarah", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("saves a stylist to database") do
      stylist = Stylist.new({:name => "Nancy", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#==") do
    it("is the same stylist if he/she has the same name and id") do
      stylist1 = Stylist.new({:name => "Blue stylist", :id => nil})
      stylist2 = Stylist.new({:name => "Blue stylist", :id => nil})
      expect(stylist1).to(eq(stylist2))
    end
  end

  describe("#clients") do
    it("returns an alphabetized array of clients for that stylist") do
      test_stylist = Stylist.new({:name => "Nancy", :id => 1})
      test_stylist.save()
      test_client = Client.new({:name => "Ruby", :stylist_id => test_stylist.id()})
      test_client.save()
      test_client2 = Client.new({:name => "Monique", :stylist_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client2, test_client]))
    end
  end

  describe("#update") do
    it("lets you update stylists in the database") do
      stylist = Stylist.new({:name => "Nancy", :id => nil})
      stylist.save()
      stylist.update({:name => "Nancie"})
      expect(stylist.name()).to(eq("Nancie"))
    end
  end

  describe("#delete") do
    it("lets you delete a stylist from the database") do
      stylist = Stylist.new({:name => "Nancy", :id => nil})
      stylist.save()
      stylist2 = Stylist.new({:name => "Rebecca", :id => nil})
      stylist2.save()
      stylist.delete()
      expect(Stylist.all()).to(eq([stylist2]))
    end

    it("deletes a stylist's clients from the database") do
      stylist = Stylist.new({:name => "Nancy", :id => nil})
      stylist.save()
      client = Client.new({:name => "Amber", :stylist_id => stylist.id()})
      stylist.save()
      client = Client.new({:name => "Tony", :stylist_id => stylist.id()})
      client.save()
      stylist.delete()
      expect(Client.all()).to(eq([]))
    end
  end
end
