require 'rails_helper'

RSpec.describe Driver, type: :model do
  subject { described_class.new }

  describe "Validations"do
    it { is_expected.to validate_presence_of(:identification) }
    it { is_expected.to validate_presence_of(:transit_license) }
    it { is_expected.to validate_presence_of(:mail) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:addres) }
  end

  describe "Whit valid attributes" do
    it "should create a driver" do
      subject.identification = 12345678
      subject.transit_license = 98765432
      subject.mail = "correo@mail.com"
      subject.phone = 12345678947
      subject.addres = "Av falsa 123"

      expect(subject).to be_valid
    end
  end

  describe "Whit invalid attributes" do
    it "is invalid if identification is string" do
      subject.identification = "blah"
      subject.transit_license = "98765432"
      subject.mail = "correo@mail.com"
      subject.phone = 12345678947
      subject.addres = "Av falsa 123"

      expect(subject).to be_invalid
      expect(subject.errors[:identification]).to eq(["El campo debe ser numerico"])
    end

    it "is invalid if transit_license is string" do
      subject.identification = "12345678"
      subject.transit_license = "blah"
      subject.mail = "correo@mail.com"
      subject.phone = 12345678947
      subject.addres = "Av falsa 123"

      expect(subject).to be_invalid
      expect(subject.errors[:transit_license]).to eq(["El campo debe ser numerico"])
    end

    it "is invalid if phone is string" do
      subject.identification = "12345678"
      subject.transit_license = "9876543"
      subject.mail = "correo@mail.com"
      subject.phone = "blah"
      subject.addres = "Av falsa 123"

      expect(subject).to be_invalid
      expect(subject.errors[:phone]).to eq(["El campo debe ser numerico"])
    end

    it "is invalid if mail is wrong format" do
      subject.identification = "12345678"
      subject.transit_license = "9876543"
      subject.mail = "correomail.com"
      subject.phone = "blah"
      subject.addres = "Av falsa 123"

      expect(subject).to be_invalid
      expect(subject.errors[:mail]).to eq(["El formato no es de correo electronico"])
    end

    it "is invalid if fields are nil" do
      subject.identification = nil
      subject.transit_license = nil
      subject.mail = "correo@mail.com"
      subject.phone = "blah"
      subject.addres = "Av falsa 123"

      expect(subject).to be_invalid
      expect(subject.errors[:identification]).to eq(["El campo es requerido", "El campo debe ser numerico"])
      expect(subject.errors[:transit_license]).to eq(["El campo es requerido", "El campo debe ser numerico"])
    end
  end
end
