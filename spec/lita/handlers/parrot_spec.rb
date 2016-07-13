require "spec_helper"

describe Lita::Handlers::Parrot, lita_handler: true do
  let(:message) { replies.last }

  it { is_expected.to route("lita parrot amora") }
  it { is_expected.to route("lita parrot") }
  it { is_expected.not_to route("lita parrotamora") }

  describe "without argument" do
    it "celebrates lonely" do
      send_message('lita parrot')

      message.should == ':parrot-conga-reversed: :mini-jeremie: :parrot-conga:'
    end
  end

  describe "with argument" do
    it "celebrates with friend" do
      send_message('lita parrot skelz0r')

      message.should == ':parrot-conga-reversed: :parrot-conga: :parrot: skelz0r :parrot: :parrot-conga-reversed: :parrot-conga:'
    end
  end
end
