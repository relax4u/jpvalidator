require File.dirname(__FILE__) + "/../spec_helper"

describe String do
  describe "jp_blank?" do
    it "全角スペースのみの場合 true となること" do
      string = "　"
      string.should be_jp_blank
    end

    it "半角スペースのみの場合 true となること" do
      string = " "
      string.should be_jp_blank
    end

    it "全角・半角スペースのみの場合 true となること" do
      string = "　 "
      string.should be_jp_blank
    end

    it "全角・半角スペース以外の文字が含まれている場合は false となること" do
      string = "　あ	"
      string.should_not be_jp_blank
    end
  end
end

describe NilClass do
  describe "jp_blank?" do
    it "blank?メソッドと同じ結果になること" do
      nil.jp_blank?.should == nil.blank?
    end
  end
end

describe FalseClass do
  describe "jp_blank?" do
    it "blank?メソッドと同じ結果になること" do
      false.jp_blank?.should == false.blank?
    end
  end
end

describe TrueClass do
  describe "jp_blank?" do
    it "blank?メソッドと同じ結果になること" do
      true.jp_blank?.should == true.blank?
    end
  end
end

describe Array do
  describe "jp_blank?" do
    it "blank?メソッドと同じ結果になること" do
      [].jp_blank?.should == [].blank?
      ["test"].jp_blank?.should == ["test"].blank?
    end
  end
end

describe Hash do
  describe "jp_blank?" do
    it "blank?メソッドと同じ結果になること" do
      {}.jp_blank?.should == {}.blank?
      {:a => 1}.jp_blank?.should == {:a => 1}.blank?
    end
  end
end

describe Numeric do
  describe "jp_blank?" do
    it "blank?メソッドと同じ結果になること" do
      0.jp_blank?.should == 0.blank?
      1.jp_blank?.should == 1.blank?
    end
  end
end

describe Object do
  describe "jp_blank?" do
    it "blank?メソッドと同じ結果になること" do
      Object.new.jp_blank?.should == Object.new.jp_blank?
    end
  end
end

