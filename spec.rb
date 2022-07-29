require 'rspec'
require './main.rb'

RSpec.describe do
  subject { business_days_of_month(today: today).last }

  context "最終営業日が水曜日になる場合" do
    let(:today) { Date.new(2022, 7, 1) }
    it { is_expected.to eq Date.new(2022, 7, 27) }
  end

  context "最終営業日が水曜日ではない場合" do
    let(:today) { Date.new(2022, 5, 1) }
    it { is_expected.to eq Date.new(2022, 5, 31) }
  end

  context "最終水曜日が祝日と重なる場合" do
    let(:today) { Date.new(2020, 4, 1) }
    it { is_expected.to eq Date.new(2020, 4, 28) }
  end
end
