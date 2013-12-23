require 'spec_helper'
require 'calabash-android/adb'

describe Calabash::Android::Adb do
  before do
    @adb = Calabash::Android::Adb.new("adb")
  end

  it "should be install command" do
    expect(@adb.install("./MyApp/MyApp-debug.apk")).to eq("adb install \"./MyApp/MyApp-debug.apk\"")
  end

  it "should be uninstall command" do
    expect(@adb.uninstall("com.myapp")).to eq("adb uninstall com.myapp")
  end

  it "should be installed package list command" do
    expect(@adb.installed_package_list()).to eq("adb shell pm list packages")
  end

  it "should be dumpsys command" do
    expect(@adb.dumpsys("window", "windows")).to eq("adb shell dumpsys window windows")
  end

  it "should be devices commnad" do
    expect(@adb.devices).to eq("adb devices")
  end

  it "should be logcat command" do
    expect(@adb.logcat("com.myapp")).to eq("adb logcat -d -v raw com.myapp:* *:S")
  end

  it "should be forward command" do
    expect(@adb.forward(8080, 9000)).to eq("adb forward tcp:8080 tcp:9000")
  end
end
