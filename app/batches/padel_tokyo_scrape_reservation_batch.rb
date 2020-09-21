class PadelTokyoScrapeReservationBatch < Batch
  require 'mechanize'
  require 'nokogiri'
  require 'open-uri'
  require 'kconv'

  def execute
    url = 'https://liv.lan.jp/padel/hp/rental_table.php?scd=1&day=20200923'

    table_data= []
        
    agent = Mechanize.new
    page = agent.get(url)
    columns =  page.search("body .cont01 .box1 .rental_table .x_scroll_box.table_responsive table.column_fix tr")
    columns.each do |column|
      elements = column.search("td")
      elements.each do |element|
        if element.get_attribute(:title).present?
          reserve_data = {}
          reserve_data["court_name"] = column.search("th")[0].inner_text
          reserve_data["date_time"] = element.get_attribute(:title) 
          reserve_data["text"] = element.inner_text 
          table_data.push(reserve_data)
        end
      end
    end
    p table_data
    p table_data.length
    binding.pry
  end
end