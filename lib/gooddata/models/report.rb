module GoodData
  class Report < GoodData::MdObject 

    class << self
      def [](id)
        if id == :all
          GoodData.get(GoodData.project.md['query'] + '/reports/')['query']['entries']
        else 
          super
        end
      end
    end

    def execute
      # puts "Executing report #{uri}"
      result = GoodData.post '/gdc/xtab2/executor3', {"report_req" => {"report" => uri}}
      
      dataResultUri = result["reportResult2"]["content"]["dataResult"]
      result = GoodData.get dataResultUri
      return EmptyResult.new([]) if result.nil?

      while result["taskState"] && result["taskState"]["status"] == "WAIT" do
        sleep 10
        result = GoodData.get dataResultUri
      end
      ReportDataResult.new(GoodData.get dataResultUri)
    end

  end
end
