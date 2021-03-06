require File.expand_path("../spec_helper", __FILE__)

describe 'TextArea' do
  before :each do
    browser.goto WatirSpec.url_for('forms_with_input_elements.html')
  end

  context 'when locating by :value' do
    before(:each) do
      browser.textarea(index: 0).set 'foo1'
      browser.textarea(index: 1).set 'foo2'
    end

    it 'finds textareas by string' do
      browser.textareas(:value, 'foo1').map(&:id).should == [browser.textarea(index: 0).id]
      browser.textareas(:value, 'foo2').map(&:id).should == [browser.textarea(index: 1).id]
    end


    it 'finds textareas by regexp' do
      browser.textareas(:value, /foo/)[0].id.should == browser.textarea(index: 0).id
      browser.textareas(:value, /foo/)[1].id.should == browser.textarea(index: 1).id
    end
  end
end
