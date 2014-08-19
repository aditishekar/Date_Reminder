require 'spec_helper'
 
describe User do
  let(:email) { Email.make }
 
  it "sends an email" do
    expect { user.send_instructions }.to change { ActionMailer::Base.deliveries.count }.by(1)
  end
end

