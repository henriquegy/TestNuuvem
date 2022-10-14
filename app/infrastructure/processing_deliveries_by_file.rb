class ProcessingDeliveriesByFile
    def self.call(*params)
        new(*params).call
    end

    def initialize(file)
        @file = file
    end

    def call
        is_valid_extenssion?
        process_file
    end

    private

    def is_valid_extenssion?
        begin
            ext = @file.original_filename.split(".")
            raise "Expected files .tab!" unless ext.include?("tab")
        rescue StandardError => e
            Rails.logger.info("ProcessingDeliveriesByFile#is_valid_extenssion? error: #{e.message}")
            raise "ProcessingDeliveriesByFile#is_valid_extenssion? error: #{e.message}"
        end
    end

    def process_file
        begin
            file_loaded = File.open(@file.original_filename)
            file_loaded.each_with_index do |line, index|
                next if index.zero?
                create_deliveries = Deliveries::ManagerDeliveries.new
                create_deliveries.create_deliveries_by_file(line.gsub(/[\\"\n\r]/, '').split(/\t/))
            end
            file_loaded.close
        rescue StandardError => e
            Rails.logger.info("ProcessingDeliveriesByFile#process_file error: #{e.message}")
            raise "ProcessingDeliveriesByFile error: #{e.message}"
        end
    end
end