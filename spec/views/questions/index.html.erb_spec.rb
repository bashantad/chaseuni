require 'spec_helper'

describe "questions/index" do
  before(:each) do
    assign(:questions, [
      stub_model(Question,
        :title => "Title",
        :description => "MyText",
        :user => nil,
        :course => nil,
        :is_multiple_choice => false
      ),
      stub_model(Question,
        :title => "Title",
        :description => "MyText",
        :user => nil,
        :course => nil,
        :is_multiple_choice => false
      )
    ])
  end

  it "renders a list of questions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
