require "spec_helper"

describe Lita::Handlers::parrot, lita_handler: true do
  let(:message) { replies.last }

  it { is_expected.to route("lita parrot amora") }
  it { is_expected.to route("lita parrot") }
  it { is_expected.not_to route("lita parrotamora") }

  describe "without argument" do
    it "celebrates lonely" do
      send_message('lita parrot')

      message.should == ':parrot-conga-reversed: :parrot: :parrot: :parrot-conga-reversed: :parrot-conga:'
    end
  end

  describe "with argument" do
    it "celebrates with friend" do
      send_message('lita parrot Amora')

      message.should == ':parrot-conga-reversed: :parrot-conga: :parrot: Amora :parrot: :parrot-conga-reversed: :parrot-conga:'
    end
  end
end
