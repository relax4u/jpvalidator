require File.dirname(__FILE__) + "/../spec_helper"

ActiveRecord::Base.establish_connection(YAML.load_file(File.dirname(__FILE__) + "/../database.yml")[:mysql])
load(File.dirname(__FILE__) + "/../schema.rb")

class Note < ActiveRecord::Base
  jpvalidator
  validates_presence_of :title, :ignore_jp_space => true
  validates_presence_of :body
end

describe ActiveRecord::Base do
  before do
    @note = Note.new(:title => "あいうえお", :body => "さしすせそ")
    raise "テストの前提条件を満たしていません" unless @note.valid?
  end

  describe "validates_presence_of" do
    it "空文字の場合は検証エラー" do
      @note.body = nil
      @note.should_not be_valid
    end

    it "半角スペースのみの場合は検証エラー" do
      @note.body = "   "
      @note.should_not be_valid
    end

    it "全角スペースのみの場合は検証OK" do
      @note.body = "　　　"
      @note.should be_valid
    end

    it "半角・全角スペースのみの場合は検証OK" do
      @note.body = " 　 "
      @note.should be_valid
    end

    it "半角・全角スペース以外の文字が含まれている場合は検証OK" do
      @note.body = "あ"
      @note.should be_valid
    end

    describe "with :ignore_jp_space" do
      it "空文字の場合は検証エラー" do
        @note.title = nil
        @note.should_not be_valid
      end

      it "半角スペースのみの場合は検証エラー" do
        @note.title = "   "
        @note.should_not be_valid
      end

      it "全角スペースのみの場合は検証エラー" do
        @note.title = "　　　"
        @note.should_not be_valid
      end

      it "半角・全角スペースのみの場合は検証エラー" do
        @note.title = " 　 "
        @note.should_not be_valid
      end

      it "半角・全角スペース以外の文字が含まれている場合は検証OK" do
        @note.title = "あ"
        @note.should be_valid
      end
    end
  end
end

