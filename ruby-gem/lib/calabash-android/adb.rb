module Calabash
  module Android
    class Adb
      def initialize(adb_path)
        @adb_path = adb_path
      end

      def install(app_path)
        "#{@adb_path} install \"#{app_path}\""
      end

      def uninstall(package_name)
        "#{@adb_path} uninstall #{package_name}"
      end

      def installed_package_list
        "#{@adb_path} shell pm list packages"
      end

      def dumpsys(*services)
        "#{@adb_path} shell dumpsys #{services.join(" ")}"
      end

      def devices
        "#{@adb_path} devices"
      end

      def logcat(tag)
        "#{@adb_path} logcat -d -v raw #{tag}:* *:S"
      end

      def forward(host_port, target_port)
        "#{@adb_path} forward tcp:#{host_port} tcp:#{target_port}"
      end
    end
  end
end
