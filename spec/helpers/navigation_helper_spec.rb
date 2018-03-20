require 'rails_helper'

RSpec.describe NavigationHelper, type: :helper do

  context 'signed in user' do

    before(:each) do
      allow(helper).to receive(:user_signed_in?).and_return(true)
    end

    context '#collapsible_elements' do
      it "returns signed_in_links partial's path" do
        expect(helper.collapsible_elements).to(
          eq 'layouts/navigation/signed_in_links'
        )
      end
    end
  end

  context 'non-signed in user' do
  
    before(:each) do
      allow(helper).to receive(:user_signed_in?).and_return(false)
    end

    context '#collapsible_elements' do
      it "returns signed_in_links partial's path" do
        expect(helper.collapsible_elements).to(
          eq 'layouts/navigation/signed_out_links'
        )
      end
    end
  end

end
